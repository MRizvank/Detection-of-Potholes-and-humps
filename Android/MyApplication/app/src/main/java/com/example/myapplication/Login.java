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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Login extends AppCompatActivity {
    EditText us,pa;
    Button lo,b1;

    public static String url="http://192.168.43.19:8000/";

    public String perm="okk";
    public static String ty,uid,unm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        us=(EditText) findViewById(R.id.editTextTextPersonName);
        pa=(EditText)findViewById(R.id.editTextTextPassword);
        lo=(Button)findViewById(R.id.button);
        b1=(Button)findViewById(R.id.button6);


        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i =new Intent(getApplicationContext(),Public.class);
                startActivity(i);
            }
        });


        lo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {




            if(!us.getText().toString().equals("") && !pa.getText().toString().equals("")) {


                AsyncTask asyncTask = new AsyncTask() {

                    @Override
                    protected Object doInBackground(Object[] objects) {

                        JSONObject postdata = new JSONObject();

                        try {
//                            postdata.put("username","aa");
                            postdata.put("unm", us.getText().toString());
//                            postdata.put("password","aa");
                            postdata.put("pa", pa.getText().toString());

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }


                        OkHttpClient client = new OkHttpClient();

                        MediaType MEDIA_TYPE = MediaType.parse("application/json");
                        RequestBody body = RequestBody.create(MEDIA_TYPE, postdata.toString());


                        Request request = new Request.Builder()
                                .url(url + "login/android/")
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
//                        Toast.makeText(getApplicationContext(),o.toString(),Toast.LENGTH_SHORT).show();
                        try {


//                                JSONObject c= new JSONObject(o.toString());
                            JSONArray array = new JSONArray(o.toString());
                            JSONObject c = array.getJSONObject(0);

                            uid = c.getString("id");
                            unm = c.getString("username");
                            String pas = c.getString("password");
                            String ty = c.getString("type");


                            if (ty.equals("user")) {
                                Intent i = new Intent(getApplicationContext(), Homepage.class);
                                startActivity(i);
                            }


                            Toast.makeText(getApplicationContext(), "Login Successfully....", Toast.LENGTH_SHORT).show();
//                              Toast.makeText(getApplicationContext(),Integer.toString(array.length()),Toast.LENGTH_SHORT).show();


                        } catch (JSONException e) {
//                            e.printStackTrace();
                            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
                        }
                    }


                }.execute();


            }
            else{
                Toast.makeText(getApplicationContext(),"Fill all Fields...",Toast.LENGTH_SHORT).show();
            }

            }
        });




//
    }
}