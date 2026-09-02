package com.exemplo.meucurso

import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class DisciplinasActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_disciplinas)

        val btnVoltar = findViewById<Button>(R.id.btnVoltarAnterior)

        // Fecha a tela atual e retorna para a tela que chamou esta
        btnVoltar.setOnClickListener {
            finish()
        }
    }
}