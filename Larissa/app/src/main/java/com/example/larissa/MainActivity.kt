package com.exemplo.larissa

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // 1. Identificar os botões do XML pelo ID
        val btnConheca = findViewById<Button>(R.id.btnConhecaCurso)
        val btnDisciplinas = findViewById<Button>(R.id.btnDisciplinasHome)

        // 2. Ação do botão "Conheça o curso" -> Vai para a Tela Sobre
        btnConheca.setOnClickListener {
            val intent = Intent(this, SobreActivity::class.java)
            startActivity(intent)
        }

        // 3. Ação do botão "Disciplinas" -> Vai para a Tela Disciplinas
        btnDisciplinas.setOnClickListener {
            val intent = Intent(this, DisciplinasActivity::class.java)
            startActivity(intent)
        }
    }
}