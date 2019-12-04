import java.io.IOException;

public class IncentiveCalc {

	public static void main(String[] args) 
	{
			try {
				java.awt.Desktop.getDesktop().browse(java.net.URI.create("http://localhost:8080/ProjectIncentive/FillDetails.jsp"));
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	}

}
