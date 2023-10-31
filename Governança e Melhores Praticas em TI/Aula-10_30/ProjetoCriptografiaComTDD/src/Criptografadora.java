
public class Criptografadora {
		
	public int criptografar(char letra) {
		
		if(letra == 'A') {
			return 19;
		} 
		else if(letra=='B') {
			return 11;
		}
		else if(letra == 'C'){
			return 71;
		} 
		else {
			return 0;
		}
		
	}

}
