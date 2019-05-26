package com.kosmo.baby.command;
//Imports the Google Cloud client library

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
import com.google.cloud.vision.v1.WebDetection.WebImage;
import com.google.cloud.vision.v1.WebDetection.WebLabel;
import com.google.cloud.vision.v1.WebDetection.WebPage;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.http.HttpEntity;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class QuickstartSample {
	
	private String google_api;
	
	public String getGoogle_api() {
		return google_api;
	}

	public void setGoogle_api(String google_api) {
		this.google_api = google_api;
	}

	public void label(String filepath) throws IOException{
		 // Instantiates a client
		 try (ImageAnnotatorClient vision = ImageAnnotatorClient.create()) {
			 
			System.out.println("dsczxczxczxc");
		
		   // The path to the image file to annotate
		   String fileName = filepath;
		
		   // Reads the image file into memory
		   Path path = Paths.get(fileName);
		   byte[] data = Files.readAllBytes(path);
		   ByteString imgBytes = ByteString.copyFrom(data);
		
		   // Builds the image annotation request
		   List<AnnotateImageRequest> requests = new ArrayList<>();
		   Image img = Image.newBuilder().setContent(imgBytes).build();
		   Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		   AnnotateImageRequest request = AnnotateImageRequest.newBuilder()
		       .addFeatures(feat)
		       .setImage(img)
		       .build();
		   requests.add(request);
		
		   // Performs label detection on the image file
		   BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
		   List<AnnotateImageResponse> responses = response.getResponsesList();
		
		   for (AnnotateImageResponse res : responses) {
		     if (res.hasError()) {
		       System.out.printf("Error: %s\n", res.getError().getMessage());
		       return;
		     }
		
		     for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
		       annotation.getAllFields().forEach((k, v) ->
		           System.out.printf("%s : %s\n", k, v.toString()));
		     }		     
		   }		   
		 }
	}
	
	public void web(String filepath) throws IOException{
		
		
		 List<AnnotateImageRequest> requests = new ArrayList<>();

		  String fileName = filepath;
		  ByteString imgBytes = ByteString.readFrom(new FileInputStream(fileName));

		  Image img = Image.newBuilder().setContent(imgBytes).build();
		  Feature feat = Feature.newBuilder().setType(Type.WEB_DETECTION).build();
		  AnnotateImageRequest request =
		      AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		  requests.add(request);

		  try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
		    BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
		    List<AnnotateImageResponse> responses = response.getResponsesList();
		    
		    System.out.println("==========================");
		    for (AnnotateImageResponse res : responses) {
		      if (res.hasError()) {
		    	  System.out.printf("Error: %s\n", res.getError().getMessage());
		        return;
		      }

		      // Search the web for usages of the image. You could use these signals later
		      // for user input moderation or linking external references.
		      // For a full list of available annotations, see http://g.co/cloud/vision/docs
		      WebDetection annotation = res.getWebDetection();
		      System.out.println("Entity:Id:Score");
		      System.out.println("===============");		     
		   
			  List<Map> collections = new Vector<Map>();
		      for (WebEntity entity : annotation.getWebEntitiesList()) {		    	
		    	  System.out.println(entity.getDescription() + " : " + entity.getEntityId() + " : "
		            + entity.getScore());
		    	  Map record = new HashMap();
		    	  record.put("web",entity.getDescription());
		    	  collections.add(record);
		      }
		      System.out.println("웹제목제목제목:" + JSONArray.toJSONString(collections));
		      //json에서 나온 값 중에서 web entity.getDescription()만 가져올려고한다.
		      google_api = JSONArray.toJSONString(collections);
		      System.out.println("google_api__" + google_api);
		      for (WebLabel label : annotation.getBestGuessLabelsList()) {
		    	  System.out.format("\nBest guess label: %s", label.getLabel());
		      }
		      System.out.println("\nPages with matching images: Score\n==");
		      for (WebPage page : annotation.getPagesWithMatchingImagesList()) {
		    	  System.out.println(page.getUrl() + " : " + page.getScore());
		      }
		      System.out.println("\nPages with partially matching images: Score\n==");
		      for (WebImage image : annotation.getPartialMatchingImagesList()) {
		    	  System.out.println(image.getUrl() + " : " + image.getScore());
		      }
		      System.out.println("\nPages with fully matching images: Score\n==");
		      for (WebImage image : annotation.getFullMatchingImagesList()) {
		    	  System.out.println(image.getUrl() + " : " + image.getScore());
		      }
		      System.out.println("\nPages with visually similar images: Score\n==");
		      for (WebImage image : annotation.getVisuallySimilarImagesList()) {
		    	  System.out.println(image.getUrl() + " : " + image.getScore());
		      }
		    }
		  }
	}
	
	
}
