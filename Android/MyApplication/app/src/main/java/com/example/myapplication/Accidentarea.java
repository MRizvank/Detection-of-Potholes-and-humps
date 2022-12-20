package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

import org.json.JSONException;
import org.json.JSONObject;

public class Accidentarea extends AppCompatActivity {
    EditText loc,det;
    Button Sub;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_accidentarea);
        loc=(EditText)findViewById(R.id.editTextTextPersonName2);
        det=(EditText)findViewById(R.id.editTextTextMultiLine);
        Sub=(Button)findViewById(R.id.button3);
        Sub.setOnClickListener(v -> {



            if(!loc.getText().toString().equals("") && !det.getText().toString().equals("")) {


                AsyncTask asyncTask = new AsyncTask() {

                    @Override
                    protected Object doInBackground(Object[] objects) {

                        JSONObject postdata = new JSONObject();

                        try {
                            postdata.put("loc", loc.getText().toString());
                            postdata.put("det", det.getText().toString());


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }


                        OkHttpClient client = new OkHttpClient();

                        MediaType MEDIA_TYPE = MediaType.parse("application/json");
                        RequestBody body = RequestBody.create(MEDIA_TYPE, postdata.toString());


                        Request request = new Request.Builder()
                                .url("http://192.168.43.19:8000/postaccdntarea/android//")
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



        });
    }
}