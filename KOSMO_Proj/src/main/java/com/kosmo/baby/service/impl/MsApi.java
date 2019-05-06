package com.kosmo.baby.service.impl;

import java.io.File;
import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.FileEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class MsApi {
	 // **********************************************
    // *** Update or verify the following values. ***
    // **********************************************

    // Replace <Subscription Key> with your valid subscription key.
    private static final String subscriptionKey = "<Subscription Key>";

    // You must use the same Azure region in your REST API method as you used to
    // get your subscription keys. For example, if you got your subscription keys
    // from the West US region, replace "westcentralus" in the URL
    // below with "westus".
    //
    // Free trial subscription keys are generated in the "westus" region.
    // If you use a free trial subscription key, you shouldn't need to change
    // this region.
    private static final String uriBase =
            "https://westcentralus.api.cognitive.microsoft.com/vision/v2.0/analyze";

    //사진이미지 넣어줘야할듯?
    private static final String imageToAnalyze =
            "https://upload.wikimedia.org/wikipedia/commons/" +
                    "1/12/Broadway_and_Times_Square_by_night.jpg";
    private String imageurl;
    
    private String ms_Api;
    
    
    public String getMs_Api() {
		return ms_Api;
	}


	public void setMs_Api(String ms_Api) {
		this.ms_Api = ms_Api;
	}


	public void startApi(String imageurl) {
    	 CloseableHttpClient httpClient = HttpClientBuilder.create().build();

         try {
             URIBuilder builder = new URIBuilder(uriBase);

             // Request parameters. All of them are optional.
             builder.setParameter("visualFeatures", "Categories,Description,Color");
             builder.setParameter("language", "en");

             // Prepare the URI for the REST API method.
             URI uri = builder.build();
             HttpPost request = new HttpPost(uri);

             // Request headers.
             //request.setHeader("Content-Type", "application/json");
             request.setHeader("Content-Type", "application/octet-stream");
             request.setHeader("Ocp-Apim-Subscription-Key", "b1a6500340aa430fbaa8ae342e77fa29");
           
             // Request body.
           // StringEntity requestEntity =
           //          new StringEntity("{\"url\":\"" + imageToAnalyze + "\"}");
            // StringEntity rquestEntity = imageurl
            // request.setEntity(requestEntity);
             
             File file = new File(imageurl);
             FileEntity reqEntity = new FileEntity(file);
             request.setEntity(reqEntity);
             

             // Call the REST API method and get the response entity.
             HttpResponse response = httpClient.execute(request);
             HttpEntity entity = response.getEntity();

             if (entity != null) {
                 // Format and display the JSON response.
                 String jsonString = EntityUtils.toString(entity);
                 JSONObject json = new JSONObject(jsonString);
                 //System.out.println("REST Response:\n");
                 //System.out.println(json.toString(2));
                 ms_Api = json.toString(2);
             }
         } catch (Exception e) {
             // Display error message.
             System.out.println(e.getMessage());
         }
     }//startApi()
    
    
}
    
    
    
    
