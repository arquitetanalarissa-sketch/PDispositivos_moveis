package com.example.larissa

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class SobreActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sobre)

        val btnVoltar = findViewById<Button>(R.id.btnVoltarHome)
        val btnDisciplinas = findViewById<Button>(R.id.btnIrDisciplinas)

        // Fecha esta tela e volta automaticamente para a Home
        btnVoltar.setOnClickListener {
            finish()
        }

        // Abre a tela de Disciplinas
        btnDisciplinas.setOnClickListener {
            val intent = Intent(this, DisciplinasActivity::class.java)
            startActivity(intent)
        }
    }
}