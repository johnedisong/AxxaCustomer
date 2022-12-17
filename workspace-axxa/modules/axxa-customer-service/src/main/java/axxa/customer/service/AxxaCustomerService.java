package axxa.customer.service;

import com.liferay.admin.kernel.util.Omniadmin;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.osgi.service.component.annotations.Component;

import axxa.customer.api.api.AxxaCustomerApi;

/**
 * @author johnbarbosa
 */
@Component(
	immediate = true,
	property = {},
	service = AxxaCustomerApi.class
)
public class AxxaCustomerService implements AxxaCustomerApi {

	@Override
	public String callRestServiceByGet(String url) {

		String respuestaSt = "";

		try {
			
//			CONECTION HTTP GET

			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Content-type", "application/JSON");
			con.setRequestProperty("Accept", "application/JSON");
			int responseCode = con.getResponseCode();
			System.out.println("GET Response Code :: " + responseCode);
			if (responseCode == HttpURLConnection.HTTP_OK) { // success
				BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "CP1252"));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				in.close();
				respuestaSt = response.toString().replace("â€œ", "\"").replace("â€�", "\"").replace("â€“", "-");
				// print result
				System.out.println("respuestaSt:::::::::   " + respuestaSt);

			} else {
				System.out.println("GET request did not work.");
			}
							        
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error:::::::------------- : " + e);
		}
		return respuestaSt;
	}

	@Override
	public String callRestServiceByPost(String url, Map<String, String> parameters) {

		String respuestaSt = "";

		try {
			
//		CONECTION HTTP GET

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-type", "application/JSON");
		con.setRequestProperty("Accept", "application/JSON");
		con.setRequestProperty("Content-Length", parameters.get(0));
		int responseCode = con.getResponseCode();
		System.out.println("POST Response Code :: " + responseCode);
		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "CP1252"));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			respuestaSt = response.toString().replace("â€œ", "\"").replace("â€�", "\"");

		} else {
			System.out.println("POST request did not work.");
		}
        
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Error:::::::------------- : " + e);
	}
	
		return respuestaSt;
	}

	// TODO enter required service methods

}