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

public class Emergencycontact extends AppCompatActivity {
    ListView li;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emergencycontact);

        try
        {
            if (android.os.Build.VERSION.SDK_INT > 9)
            {
                StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                StrictMode.setThreadPolicy(policy);
            }
        }
        catch(Exception e)
        {
        }
        li=(ListView)findViewById(R.id.listview4);

        AsyncTask asyncTask=new AsyncTask() {

            @Override
            protected Object doInBackground(Object[] objects) {




                OkHttpClient client=new OkHttpClient();
                Request request=new Request.Builder()
                        .url("http://192.168.43.19:8000/viewemergencycontact/android/")
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
//                        String e_id = c.getString("e_id");
                        String contact = c.getString("contact");
                        String name = c.getString("name");
                        String place = c.getString("place");



                        HashMap<String, String> hmap = new HashMap<String, String>();
//                        hmap.put("e_id", e_id);
                        hmap.put("contact", contact);
                        hmap.put("name", name);
                        hmap.put("place", place);



                        al.add(hmap);

                    }
                    ListAdapter lis=new SimpleAdapter(Emergencycontact.this,al,R.layout.emergency,new String[]{"contact","name","place"},new int[]{R.id.textView28,R.id.textView32,R.id.textView33});
                    li.setAdapter(lis);

                } catch (JSONException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(),e.toString(),Toast.LENGTH_SHORT).show();


                }

            }
        }.execute();

    }
}

