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

public class Webhitter {

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
  
  
  public List<Property> searchResults(String urlstring, String searchString) throws IOException, JSONException
  {
	  JSONObject json = readJsonFromUrl(urlstring);
	    JSONObject reponse = json.getJSONObject("response");
	    org.json.JSONArray listings = reponse.getJSONArray("listings");
	    System.out.println(listings.length());
	    for (int i = 0 ; i < listings.length(); i++)
	    	{
	    		String propertyname = listings.getJSONObject(i).getString("title");
	    		int locationid = 1;
	    		String propertytype = listings.getJSONObject(i).getString("listing_type");
	    		int amenityid = 2;
	    		String address = "not available";
	    		String city = searchString;
	    		String state = "not available";
	    		int zip = 00;
	    		int price = listings.getJSONObject(i).getInt("price");
	    		String url = listings.getJSONObject(i).getString("img_url");
	    		//String lister_url = listings.getJSONObject(i).getString("lister_url");
	    		String guiid = listings.getJSONObject(i).getString("guid");
	    		
	    		DAOProperty property = new DAOProperty();
	    		Property prop = new Property();
	    		List<Property> properties = property.findPropertythruGuiid(guiid);
	    		
	    		if (properties.isEmpty())
	    		{
	    			int id = property.insertNewProperty(propertyname, locationid, propertytype, amenityid, address, city, state, zip, price, url, guiid);
	    		}
	    		else
	    		{
	    			System.out.println("duplicate case");
	    		}
	    	}
	    
	    DAOProperty newprop = new DAOProperty();
	    return newprop.findPropertybyCity(searchString);
  }

 /* public static void main(String[] args) throws IOException, JSONException 
  {
    Webhitter  web = new Webhitter();
    List<Property> lop = web.searchResults("http://api.nestoria.co.uk/api?action=search_listings&encoding=json&pretty=1&place_name=soho&country=uk&listing_type=buy",
    		"Boston");
    
    for (Property p : lop)
    {
    	System.out.println(p.getPropertyname());
    } 
  }*/
}