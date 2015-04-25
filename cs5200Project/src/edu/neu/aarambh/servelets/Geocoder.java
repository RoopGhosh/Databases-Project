package edu.neu.aarambh.servelets;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.List;

import org.codehaus.jettison.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import edu.neu.aarambh.DAO.DAOProperty;
import edu.neu.aarambh.classes.Property;

public class Geocoder {
	private String address;
	private String city;
	private String Country;
	private String zip;

	private String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=LATITUDE,LONGITUDE&key=AIzaSyCzohtO0lch8yrj9Ahuy5-I69hfDzl3DLE";
	
	public Geocoder latlong2Address(double lati, double longi) throws IOException, JSONException
	{
		Geocoder geocode = new Geocoder();
		String latitude = Double.toString(lati);
		String longitude = Double.toString(longi);
		url = url.replace("LATITUDE", latitude);
		
		url = url.replace("LONGITUDE", longitude);
		//System.out.println(url);
		JSONObject json = readJsonFromUrl(url);
	    org.json.JSONArray listings = json.getJSONArray("results");
	    JSONObject response = listings.getJSONObject(0);
	    org.json.JSONArray address_component = response.getJSONArray("address_components");
	    
	    JSONObject address0 = address_component.getJSONObject(0);
	    JSONObject address1 = address_component.getJSONObject(1);
	    JSONObject city = address_component.getJSONObject(2);
	    JSONObject zip = address_component.getJSONObject((address_component.length() - 1));
	    JSONObject country = address_component.getJSONObject((address_component.length() - 2));
	    
	    String fulladdress = address0.getString("long_name") + " " + address1.getString("long_name");
	    
	    geocode.setAddress(fulladdress);
	    geocode.setCity(city.getString("long_name"));
	    geocode.setCountry(country.getString("long_name"));
	    geocode.setZip(zip.getString("long_name"));
	  
		return geocode;
	}

  private static String readAll(Reader rd) throws IOException {
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

  public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
    InputStream is = new URL(url).openStream();
    try {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    } finally {
      is.close();
    }
  }

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getCountry() {
	return Country;
}

public void setCountry(String country) {
	Country = country;
}

public String getZip() {
	return zip;
}

public void setZip(String zip) {
	this.zip = zip;
}

public String getUrl() {
	return url;
}

public Geocoder(String address, String city, String country, String zip) {
	super();
	this.address = address;
	this.city = city;
	Country = country;
	this.zip = zip;
}

public Geocoder() {
	super();
}


/*public static void main (String[] args)
{
	Geocoder geo = new Geocoder();
	Geocoder newgeo = new Geocoder();
	try {
		newgeo = geo.latlong2Address(51.4646492004394531, -0.26576000452041626);
	} catch (IOException | JSONException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println(newgeo.getZip());
	
}*/
}
  