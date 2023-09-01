using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace Fiap.Cartao
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            //aqui eu estou fazendo a conexão com a aplicação, eu não preciso passar nenhuma porta pq estou rodando no próprio container
            var factory = new ConnectionFactory { HostName = "localhost" };
            using var connection = factory.CreateConnection();
            using var channel = connection.CreateModel();

            //queue = nome da fila
            //durable = se eu quero q a fila continue dps que eu desligar a aplicação.
            //autodelete = quando eu desligar a aplicação ele destruiria o 
            channel.QueueDeclare(queue: "hello",
                                 durable: false,
                                 exclusive: false,
                                 autoDelete: false,
                                 arguments: null);

            Console.WriteLine(" [*] Aguardando novas mensagens.");

            //esse evento ele precisa ser configurado para a aplicação ouvir quando chega uma requisição;
            //ea = event arguemt ou seja oq tem dentro da mensagem do evento;
            //o body é um array de binario;
            // e preciso converter novamente para string usando o Encoding.UFT8;
            var consumer = new EventingBasicConsumer(channel);
            consumer.Received += async (model, ea) =>
            {
                var body = ea.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                Console.WriteLine($" [x] recebido {message}");

                //todo metodo q retorna uma task eu preciso esperar ele, portanto precisamos utilizar async
                
                var cartao = await ValidarCartao2();

                if (cartao is null)
                {
                    Console.WriteLine("Erro ao validar cartão");
                    //o Nack não retira da fila
                    //tag, multiplos, reenfileirar
                    channel.BasicNack(ea.DeliveryTag, false, false);
                }

                Console.WriteLine("Cartão validado com sucesso");
                //ack - ele identifica a mensagem e tira ela da fila
                channel.BasicAck(ea.DeliveryTag, false);
            };
            //atraves do chanel eu consigo configurar como eu vou interagir e me comunicar com a aplicação
            channel.BasicConsume(queue: "hello",
                                 autoAck: false,
                                 consumer: consumer);
            Console.WriteLine(" Pressione [enter] para finalizar.");
            Console.ReadLine();
        }

        static async Task<Cartao> ValidarCartao()
        {
            //a ideia do task é suportar a programação de threads e utilizar mais núcleos do computador,
            //portanto, se tivemos acontecendo duas validações de cartão ao mesmo tempo, elas vão acontecer de
            //maneira paralela. Ou seja, com a Task vamos conseguir otimizar melhor esse processo de multiplas
            //solicitações que estão acontecend em paralelo;
            var httppClient = new HttpClient();
            //não sabemos quanto tempo a API vai demorar para ser processada e por isso pedimos
            //para o código vir processando e esperar o retorno da API para continuar a processar
            //async = assicrono, ou seja, o metodo ele é executado de forma assincrona
            var response = await httppClient.GetFromJsonAsync<Cartao>("https://demo2982399.mockable.io/validar-cartao");
            //o metodo vai retornar uma cartao e o cartão vai ser validado
            if (response == null) 
            {
                Console.WriteLine("Erro ao validar cartão");
                return null;
            }
            return response;
        }

        static async Task<Cartao> ValidarCartao2()
        {
            var httppClient = new HttpClient();            
            var response = await httppClient.GetAsync("https://demo2982399.mockable.io/validar-cartao");
           
            if (response.IsSuccessStatusCode)
            {
                Console.WriteLine("Erro ao validar cartão");
               throw new Exception($"Erro ao validar. Status Code: {response.StatusCode}");
            }
            return JsonSerializer.Deserialize<Cartao>(response.Content.ReadAsStream());
        }

        public class Cartao
        {
            public string idPedido { get; set; }
            public string numeroCartao { get; set; }
            public string portador { get; set; }
            public int cvv { get; set; }
            public string vencimento { get; set; }
        }

    }
}