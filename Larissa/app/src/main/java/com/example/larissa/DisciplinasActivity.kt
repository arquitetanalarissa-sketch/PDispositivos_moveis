package com.example.larissa

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity

class DisciplinasActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_disciplinas)

        // 1. Mapear os botões do XML usando os IDs configurados no activity_disciplinas.xml
        val btnMobile = findViewById<Button>(R.id.btnDesenvolvimentoMobile)
        val btnWeb = findViewById<Button>(R.id.btnDesenvolvimentoWeb)

        // 2. Definir o evento de clique para o botão 'Desenvolvimento Mobile'
        btnMobile?.setOnClickListener {
            abrirDetalhes(
                nome = "Desenvolvimento Mobile",
                carga = "80 horas",
                modalidade = "Presencial",
                professor = "Leandro Melo",
                preRequisito = "Programação",
                descricao = "Nesta disciplina são estudados conceitos relacionados ao desenvolvimento de aplicativos Android utilizando Kotlin."
            )
        }

        // 3. Definir o evento de clique para o botão 'Desenvolvimento Web'
        btnWeb?.setOnClickListener {
            abrirDetalhes(
                nome = "Desenvolvimento Web",
                carga = "80 horas",
                modalidade = "EAD",
                professor = "João Silva",
                preRequisito = "Lógica de Programação",
                descricao = "Estudo de tecnologias para desenvolvimento web com HTML, CSS, JavaScript e backend."
            )
        }

        // Repita o bloco acima para as demais disciplinas cadastradas na sua tela!
    }

    // Função auxiliar responsável por criar a Intent, anexar as informações e abrir a tela de detalhes
    private fun abrirDetalhes(
        nome: String,
        carga: String,
        modalidade: String,
        professor: String,
        preRequisito: String,
        descricao: String
    ) {
        val intent = Intent(this, DetalhesDisciplinaActivity::class.java)

        // Passando cada informação com uma chave (Extra) identificadora
        intent.putExtra("EXTRA_NOME", nome)
        intent.putExtra("EXTRA_CARGA", carga)
        intent.putExtra("EXTRA_MODALIDADE", modalidade)
        intent.putExtra("EXTRA_PROFESSOR", professor)
        intent.putExtra("EXTRA_PREREQUISITO", preRequisito)
        intent.putExtra("EXTRA_DESCRICAO", descricao)

        startActivity(intent) // Executa a transição de tela
    }
}