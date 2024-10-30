# Lista de Estudos 📚

Este projeto é um aplicativo móvel desenvolvido em Flutter, com o objetivo de gerenciar tópicos de estudo. Ele permite criar, visualizar, editar e excluir tópicos, além de oferecer filtragem por prioridades. Utiliza o Firebase como banco de dados para armazenar as informações.

## 🗑️ Funcionalidades

- **Adicionar Tópicos**: Criação de novos tópicos com nome, descrição e prioridade.
- **Exibir Tópicos**: Lista todos os tópicos salvos, com exibição de nome, descrição e prioridade.
- **Editar Tópicos**: Edição dos dados de um tópico selecionado.
- **Excluir Tópicos**: Remoção de tópicos indesejados.
- **Filtrar por Prioridade**: Exibição de tópicos com base na prioridade selecionada.

## 🚀 Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento do aplicativo.
- **Firebase**: Utilizado como banco de dados para armazenar e sincronizar os dados em tempo real.
- **Provider**: Gerenciamento de estado para integração das views com os ViewModels.

## 🛀 Estrutura do Projeto

```bash
/lib
  ├── models/              # Modelos de dados
  ├── services/            # Serviços de autenticação e acesso ao banco de dados
  ├── viewmodels/          # Lógica de negócios e gerenciamento de estado
  ├── views/               # Telas do aplicativo (UI)
  ├── utils/               # Arquivos utilitários como constantes e cores
  ├── widgets/             # Componentes personalizados reutilizáveis
  ├── main.dart            # Arquivo principal
```

## 🔧 Instalação e Execução

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Romeu04/N2-Flutter.git
   ```
2. **Navegue até a pasta do projeto**:
   ```bash
   cd nome-do-repositorio
   ```
3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```
4. **Execute o aplicativo**:
   ```bash
   flutter run
   ```

## 🔧 Configuração do Firebase

Certifique-se de ter configurado seu projeto no Firebase e adicionado os arquivos de configuração `google-services.json` (para Android) e `GoogleService-Info.plist` (para iOS) nas pastas corretas.
