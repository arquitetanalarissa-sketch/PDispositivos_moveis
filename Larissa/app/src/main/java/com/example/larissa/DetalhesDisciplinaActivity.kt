package com.example.larissa

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class DetalhesDisciplinaActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detalhes_disciplina)

        // 1. Mapear componentes do XML
        val btnCompartilhar = findViewById<Button>(R.id.btnCompartilhar)
        val tvNome = findViewById<TextView>(R.id.tvNomeDisciplina)
        val tvCarga = findViewById<TextView>(R.id.tvCargaHoraria)
        val tvModalidade = findViewById<TextView>(R.id.tvModalidade)
        val tvProfessor = findViewById<TextView>(R.id.tvProfessor)
        val tvPreRequisito = findViewById<TextView>(R.id.tvPreRequisito)
        val tvDescricao = findViewById<TextView>(R.id.tvDescricao)
        val btnVoltar = findViewById<Button>(R.id.btnVoltar)

        // 2. Receber dados enviados via Intent da tela anterior
        val nome = intent.getStringExtra("EXTRA_NOME") ?: "Disciplina"
        val carga = intent.getStringExtra("EXTRA_CARGA") ?: "--"
        val modalidade = intent.getStringExtra("EXTRA_MODALIDADE") ?: "--"
        val professor = intent.getStringExtra("EXTRA_PROFESSOR") ?: "--"
        val preRequisito = intent.getStringExtra("EXTRA_PREREQUISITO") ?: "--"
        val descricao = intent.getStringExtra("EXTRA_DESCRICAO") ?: "--"

        // 3. Exibir os dados recebidos nos TextViews
        tvNome.text = nome
        tvCarga.text = "Carga horária: $carga"
        tvModalidade.text = "Modalidade: $modalidade"
        tvProfessor.text = "Professor: $professor"
        tvPreRequisito.text = "Pré-requisito: $preRequisito"
        tvDescricao.text = "Descrição:\n$descricao"

        // 4. Ação do Botão Voltar (encerra esta tela e retorna às Disciplinas)
        btnVoltar.setOnClickListener {
            finish()
        }

        // 5. Ação do Botão Compartilhar (Desafio Final - Parte 10)
        btnCompartilhar.setOnClickListener {
            val sendIntent = Intent().apply {
                action = Intent.ACTION_SEND
                putExtra(Intent.EXTRA_TEXT, "Estou cursando $nome no curso!")
                type = "text/plain"
            }
            val shareIntent = Intent.createChooser(sendIntent, "Compartilhar via")
            startActivity(shareIntent)
        }
    } // Fecha o onCreate
} // Fecha a classe DetalhesDisciplinaActivity