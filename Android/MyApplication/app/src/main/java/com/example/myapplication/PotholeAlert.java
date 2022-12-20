package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class PotholeAlert extends AppCompatActivity {
    ListView li;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pothole_alert);
        li=(ListView)findViewById(R.id.listview5);

        li.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> arg0, View arg1, int arg2,
                                    long arg3) {
                // TODO Auto-generated method stub

                HashMap<String,String> hmap=(HashMap<String, String>)arg0.getItemAtPosition(arg2);
                String lat=hmap.get("lat");
                String lon=hmap.get("lon");



                String	url="https://www.google.co.in/maps/place/"+lat+"+"+lon+"/@"+lat+","+lon+",19z";
                try{
                    Intent i = new Intent(Intent.ACTION_VIEW);
                    i.setData(Uri.parse(url));
                    startActivity(i);
                }
                catch (Exception e) {
                    // TODO: handle exception
                    Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
                }
            }
        });


        AsyncTask asyncTask=new AsyncTask() {

            @Override
            protected Object doInBackground(Object[] objects) {




                OkHttpClient client=new OkHttpClient();
                Request request=new Request.Builder()
                        .url("http://192.168.43.19:8000/potholealert/android/")
                        .build();
                Response response=null;

                try {
                    response=client.newCall(request).execute();
                    return response.body().string();

                }
                catch (Exception ex)
                {
                    Toast.makeText(getApplicationContext(),"hello",Toast.LENGTH_SHORT).show();
                }


                return null;
            }



            @Override
            protected void onPostExecute(Object o) {
                try {
                    ArrayList<HashMap<String,String>> al=new ArrayList<>();
                    JSONArray array= new JSONArray(o.toString());
                    String ln=Integer.toString( array.length());

                    Toast.makeText(getApplicationContext(),ln, Toast.LENGTH_SHORT).show();
                    for(int i=0;i<array.length();i++) {
                        JSONObject c = array.getJSONObject(i);
//
                        String id = c.getString("id");
                        String area = c.getString("area");
                        String details = c.getString("details");

                        String alert = c.getString("alert");
                        String lat = c.getString("lat");
                        String lon = c.getString("lon");



                        HashMap<String, String> hmap = new HashMap<String, String>();
//
                        hmap.put("id", id);
                        hmap.put("area", area);
                        hmap.put("details", details);
                        hmap.put("alert", alert);
                        hmap.put("lat", lat);
                        hmap.put("lon", lon);




                        al.add(hmap);

                    }
                    ListAdapter lis=new SimpleAdapter(PotholeAlert.this,al,R.layout.potholealert,new String[]{"area","details","alert","lat","lon"},new int[]{R.id.textView37,R.id.textView38,R.id.textView39,R.id.textView40,R.id.textView41});
                    li.setAdapter(lis);

                } catch (JSONException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(),e.toString(),Toast.LENGTH_SHORT).show();


                }

            }
        }.execute();

    }
}