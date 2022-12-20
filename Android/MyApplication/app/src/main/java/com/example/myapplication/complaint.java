package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class complaint extends AppCompatActivity {
    EditText com;
    Button pos;
    ListView li;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_complaint);
        com=(EditText)findViewById(R.id.editTextTextMultiLine3);
        pos=(Button)findViewById(R.id.button4);
        li=(ListView)findViewById(R.id.listview1);
        pos.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                if(!com.getText().toString().equals("")) {


                    AsyncTask asyncTask = new AsyncTask() {

                        @Override
                        protected Object doInBackground(Object[] objects) {

                            JSONObject postdata = new JSONObject();

                            try {
                                postdata.put("comp", com.getText().toString());
                                postdata.put("uid", Login.uid);


                            } catch (JSONException e) {
                                e.printStackTrace();
                            }


                            OkHttpClient client = new OkHttpClient();

                            MediaType MEDIA_TYPE = MediaType.parse("application/json");
                            RequestBody body = RequestBody.create(MEDIA_TYPE, postdata.toString());


                            Request request = new Request.Builder()
                                    .url("http://192.168.43.19:8000/postcomplaint/android//")
                                    .post(body)
                                    .header("Accept", "application/json")
                                    .header("Content-Type", "application/json")
                                    .build();
                            Response response = null;
                            try {
                                response = client.newCall(request).execute();
                                return response.body().string();

                            } catch (Exception ex) {
                                Log.e("err", ex.getMessage());
//                            Toast.makeText(getApplicationContext(),"hello",Toast.LENGTH_SHORT).show();
                            }
                            return null;
                        }

                        @Override
                        protected void onPostExecute(Object o) {

                            Intent i = new Intent(getApplicationContext(), Homepage.class);
                            startActivity(i);


                            Toast.makeText(getApplicationContext(), "inserted  Successfully....", Toast.LENGTH_SHORT).show();

                        }


                    }.execute();

                }

                else{
                    Toast.makeText(getApplicationContext(),"Fill all Fields...",Toast.LENGTH_SHORT).show();
                }


            }
        });

        AsyncTask asyncTask=new AsyncTask() {

            @Override
            protected Object doInBackground(Object[] objects) {




                OkHttpClient client=new OkHttpClient();
                Request request=new Request.Builder()
                        .url("http://192.168.43.19:8000/viewcomplaint/android/")
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
                        String user_id = c.getString("user_id");
                        String replay = c.getString("replay");
                        String date = c.getString("date");
                        String complaint = c.getString("complaint");



                        HashMap<String, String> hmap = new HashMap<String, String>();
//
                        hmap.put("id", id);
                        hmap.put("user_id", user_id);
                        hmap.put("replay", replay);
                        hmap.put("date", date);
                        hmap.put("complaint", complaint);



                        al.add(hmap);

                    }
                    ListAdapter lis=new SimpleAdapter(complaint.this,al,R.layout.complaint ,new String[]{"complaint","replay","date"},new int[]{R.id.textView25 ,R.id.textView35,R.id.textView36});
                    li.setAdapter(lis);

                } catch (JSONException e) {
                    e.printStackTrace();
                    Toast.makeText(getApplicationContext(),e.toString(),Toast.LENGTH_SHORT).show();


                }

            }
        }.execute();






























    }
}