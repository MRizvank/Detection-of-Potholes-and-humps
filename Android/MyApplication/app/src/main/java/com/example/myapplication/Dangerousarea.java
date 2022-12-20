package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
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
import java.util.ListIterator;

public class Dangerousarea extends AppCompatActivity {
    ListView li;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dangerousarea);

//        try
//        {
//            if (android.os.Build.VERSION.SDK_INT > 9)
//            {
//                StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
//                StrictMode.setThreadPolicy(policy);
//            }
//        }
//        catch(Exception e)
        li=(ListView)findViewById(R.id.listview2);





        AsyncTask asyncTask=new AsyncTask() {

            @Override
            protected Object doInBackground(Object[] objects) {




                OkHttpClient client=new OkHttpClient();
                Request request=new Request.Builder()
                        .url("http://192.168.43.19:8000/viewdangerousarea/android/")
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
                        String location = c.getString("location");
                        String details = c.getString("details");



                        HashMap<String, String> hmap = new HashMap<String, String>();
//                        hmap.put("e_id", e_id);
                        hmap.put("id", id);
                        hmap.put("location", location);
                        hmap.put("details", details);



                        al.add(hmap);

                    }
                    ListAdapter lis=new SimpleAdapter(Dangerousarea.this,al,R.layout.dangerousarea,new String[]{"location","details"},new int[]{R.id.textView21,R.id.textView23});
                    li.setAdapter(lis);

                } catch (JSONException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(),e.toString(),Toast.LENGTH_SHORT).show();


                }

            }
        }.execute();
    }

}