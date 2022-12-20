package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;

public class Homepage extends AppCompatActivity {
    Button i1,i2,i3,i4,i5;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_homepage);
        i1=(Button)findViewById(R.id.button11);
        i2=(Button)findViewById(R.id.button12);
        i3=(Button )findViewById(R.id.button13);
        i4=(Button)findViewById(R.id.button14);
        i5=(Button)findViewById(R.id.button15);


        i1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= new Intent(Homepage.this,Accidentarea.class);
                startActivity(i);
            }
        });


        i2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= new Intent(Homepage.this,complaint.class);
                startActivity(i);

            }
        });

        i3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= new Intent(Homepage.this,Dangerousarea.class);
                startActivity(i);
            }
        });
        i4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= new Intent(Homepage.this,Emergencycontact.class);
                startActivity(i);
            }
        });
        i5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i= new Intent(Homepage.this,PotholeAlert.class);
                startActivity(i);
            }
        });
//        i6.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent i= new Intent(Homepage.this,Login.class);
//                startActivity(i);
//            }
//        });
//        i7.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent i= new Intent(Homepage.this,MainActivity.class);
//                startActivity(i);
//            }
//        });
//        i8.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Intent i= new Intent(Homepage.this,PotholeAlert.class);
//                startActivity(i);
//            }
//        });
    }
}