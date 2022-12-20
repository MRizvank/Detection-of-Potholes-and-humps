package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

import org.json.JSONException;
import org.json.JSONObject;

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

                AsyncTask asyncTask=new AsyncTask(){

                    @Override
                    protected Object doInBackground(Object[] objects) {

                        JSONObject postdata = new JSONObject();

                        try {
                            postdata.put("comp",com.getText().toString());
                            postdata.put("uid",Login.uid);


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }


                        OkHttpClient client=new OkHttpClient();

                        MediaType MEDIA_TYPE = MediaType.parse("application/json");
                        RequestBody body = RequestBody.create(MEDIA_TYPE, postdata.toString());


                        Request request=new Request.Builder()
                                .url("http://192.168.43.19:8000/postcomplaint/android//")
                                .post(body)
                                .header("Accept", "application/json")
                                .header("Content-Type", "application/json")
                                .build();
                        Response response=null;
                        try {
                            response=client.newCall(request).execute();
                            return response.body().string();

                        }
                        catch (Exception ex)
                        {
                            Log.e("err",ex.getMessage());
//                            Toast.makeText(getApplicationContext(),"hello",Toast.LENGTH_SHORT).show();
                        }
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Object o) {

                        Intent i =new Intent(getApplicationContext(),Homepage.class);
                        startActivity(i);




                        Toast.makeText(getApplicationContext(),"inserted  Successfully....",Toast.LENGTH_SHORT).show();

                    }


                }.execute();


            }
        });
    }
}