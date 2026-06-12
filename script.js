const servicos = [
  {
    nome: "Maria Oliveira",
    categoria: "Alimentação",
    descricao: "Produção de marmitas caseiras e salgados por encomenda.",
    regiao: "Bairro Santa Terezinha",
    horario: "Segunda a sábado, 8h às 18h",
    contato: "(67) 99999-0001"
  },
  {
    nome: "João Santos",
    categoria: "Manutenção",
    descricao: "Pequenos reparos residenciais, montagem de móveis e consertos simples.",
    regiao: "Santa Terezinha e bairros próximos",
    horario: "Segunda a sexta, 7h às 17h",
    contato: "(67) 99999-0002"
  },
  {
    nome: "Ana Paula",
    categoria: "Beleza",
    descricao: "Serviços de manicure, pedicure e design de sobrancelhas.",
    regiao: "Atendimento em domicílio",
    horario: "Terça a sábado, 9h às 19h",
    contato: "(67) 99999-0003"
  },
  {
    nome: "Carlos Mendes",
    categoria: "Elétrica",
    descricao: "Instalação de tomadas, troca de lâmpadas e pequenos serviços elétricos.",
    regiao: "Aquidauana/MS",
    horario: "Segunda a sábado, 8h às 17h",
    contato: "(67) 99999-0004"
  },
  {
    nome: "Fernanda Lima",
    categoria: "Limpeza",
    descricao: "Limpeza residencial, organização de ambientes e faxinas agendadas.",
    regiao: "Bairro Santa Terezinha",
    horario: "Segunda a sexta, 8h às 16h",
    contato: "(67) 99999-0005"
  }
];

const listaServicos = document.getElementById("listaServicos");
const botoesFiltro = document.querySelectorAll(".filtro-btn");
const formCadastro = document.getElementById("formCadastro");
const mensagemCadastro = document.getElementById("mensagemCadastro");

function mostrarServicos(categoriaSelecionada = "Todos") {
  listaServicos.innerHTML = "";

  const servicosFiltrados = categoriaSelecionada === "Todos"
    ? servicos
    : servicos.filter(servico => servico.categoria === categoriaSelecionada);

  if (servicosFiltrados.length === 0) {
    listaServicos.innerHTML = `
      <div class="col-12">
        <div class="alert alert-warning">
          Nenhum serviço encontrado nesta categoria.
        </div>
      </div>
    `;
    return;
  }

  servicosFiltrados.forEach(servico => {
    const card = document.createElement("div");
    card.className = "col-md-6 col-lg-4";

    card.innerHTML = `
      <div class="card servico-card shadow-sm">
        <div class="card-body">
          <span class="categoria-badge">${servico.categoria}</span>
          <h3 class="h5">${servico.nome}</h3>
          <p>${servico.descricao}</p>
          <p class="info-servico"><strong>Região:</strong> ${servico.regiao}</p>
          <p class="info-servico"><strong>Horário:</strong> ${servico.horario}</p>
          <p class="info-servico"><strong>Contato:</strong> ${servico.contato}</p>
        </div>
      </div>
    `;

    listaServicos.appendChild(card);
  });
}

botoesFiltro.forEach(botao => {
  botao.addEventListener("click", () => {
    const categoria = botao.getAttribute("data-categoria");

    botoesFiltro.forEach(item => {
      item.classList.remove("btn-primary");
      item.classList.add("btn-outline-primary");
    });

    botao.classList.remove("btn-outline-primary");
    botao.classList.add("btn-primary");

    mostrarServicos(categoria);
  });
});

formCadastro.addEventListener("submit", function(evento) {
  evento.preventDefault();

  const novoServico = {
    nome: document.getElementById("nome").value,
    categoria: document.getElementById("categoria").value,
    descricao: document.getElementById("descricao").value,
    regiao: document.getElementById("regiao").value,
    horario: document.getElementById("horario").value,
    contato: document.getElementById("contato").value
  };

  servicos.push(novoServico);

  mostrarServicos("Todos");

  formCadastro.reset();

  mensagemCadastro.classList.remove("d-none");

  setTimeout(() => {
    mensagemCadastro.classList.add("d-none");
  }, 4000);
});

mostrarServicos();
