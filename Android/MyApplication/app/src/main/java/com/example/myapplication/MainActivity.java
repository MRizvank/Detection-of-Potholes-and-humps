package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {
    EditText nm,ad,mail,phone,us,pa;
    RadioButton m,f;
    Button re;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        nm=(EditText) findViewById(R.id.editTextTextPersonName3);
        ad=(EditText) findViewById( R.id.editTextTextMultiLine2);
        mail=(EditText) findViewById(R.id.editTextTextEmailAddress2);
        phone=(EditText)findViewById(R.id.editTextTextPersonName4);

        re=(Button) findViewById(R.id.button2);
        us=(EditText)findViewById(R.id.editTextTextPersonName5);
        pa=(EditText)findViewById(R.id.editTextTextPassword2);
        re.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String eml = mail.getText().toString();
                String emailPattern = "[a-zA-Z0-9._-]+@gmail+\\.+com+";
                if (!eml.matches(emailPattern)) {
                    mail.setText("");
                    mail.setError("Not in e-mail format");
                }
                String mo = phone.getText().toString();
                if (mo.length() != 10) {
                    phone.setText("");
                    phone.setError("Invalid entry");
                }

                if(!nm.getText().toString().equals("") && !ad.getText().toString().equals("")&& !mail.getText().toString().equals("")&& !phone.getText().toString().equals("")&& !us.getText().toString().equals("")&& !pa.getText().toString().equals("")) {


                    AsyncTask asyncTask = new AsyncTask() {

                        @Override
                        protected Object doInBackground(Object[] objects) {

                            JSONObject postdata = new JSONObject();

                            try {
                                postdata.put("unm", us.getText().toString());
                                postdata.put("pass", pa.getText().toString());
                                postdata.put("email", mail.getText().toString());
                                postdata.put("ph", phone.getText().toString());
                                postdata.put("name", nm.getText().toString());
                                postdata.put("add", ad.getText().toString());


                            } catch (JSONException e) {
                                e.printStackTrace();
                            }


                            OkHttpClient client = new OkHttpClient();

                            MediaType MEDIA_TYPE = MediaType.parse("application/json");
                            RequestBody body = RequestBody.create(MEDIA_TYPE, postdata.toString());


                            Request request = new Request.Builder()
                                    .url(Login.url + "registration/android/")
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

                            Intent i = new Intent(getApplicationContext(), Login.class);
                            startActivity(i);


                            Toast.makeText(getApplicationContext(), "User Registred Successfully....", Toast.LENGTH_SHORT).show();

                        }


                    }.execute();

                }
                else{
                    Toast.makeText(getApplicationContext(),"Fill all Fields...",Toast.LENGTH_SHORT).show();
                }



            }
        });
    }
}