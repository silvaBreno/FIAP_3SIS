using System.Text;
using RabbitMQ.Client;
using RabbitMQ.Client.Events;

namespace Fiap.Cartao
{
    internal class Program
    {
        static void Main(string[] args)
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
            consumer.Received += (model, ea) =>
            {
                var body = ea.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                Console.WriteLine($" [x] recebido {message}");

                channel.BasicAck(ea.DeliveryTag, false);
            };
            //atraves do chanel eu consigo configurar como eu vou interagir e me comunicar com a aplicação
            channel.BasicConsume(queue: "hello",
                                 autoAck: false,
                                 consumer: consumer);
            Console.WriteLine(" Pressione [enter] para finalizar.");
            Console.ReadLine();
        }
    }
}