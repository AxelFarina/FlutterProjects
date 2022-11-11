package com.example.breakfast

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import com.example.breakfast.databinding.ActivityLoginBinding

class LoginActivity : FragmentActivity() {
    lateinit var mBinding: ActivityLoginBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mBinding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(mBinding.root)

        mBinding.btnAcceder.setOnClickListener {
            startActivity(Intent(this,MainActivity::class.java))
        }
    }
}