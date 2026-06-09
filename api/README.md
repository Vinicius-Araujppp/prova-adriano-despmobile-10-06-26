# API de Contatos

API REST em Node.js + Express usando PostgreSQL. Ela foi criada para funcionar no Render e atender o app Flutter pelas rotas de contatos.

## Rotas

- `GET /health`
- `GET /contatos`
- `GET /contatos/:id`
- `POST /contatos`
- `PUT /contatos/:id`
- `DELETE /contatos/:id`

Exemplo de corpo para cadastro e atualizacao:

```json
{
  "nome": "Joao Silva",
  "telefone": "(11) 99999-9999",
  "email": "joao@email.com"
}
```

## Rodar localmente

1. Entre na pasta da API:

```bash
cd api
```

2. Instale as dependencias:

```bash
npm install
```

3. Crie um arquivo `.env` baseado no `.env.example`:

```env
DATABASE_URL=postgresql://usuario:senha@localhost:5432/contatos
PORT=3000
```

4. Inicie:

```bash
npm run dev
```

## Publicar no Render

1. Crie um banco PostgreSQL no Render.
2. Crie um Web Service apontando para este repositorio.
3. Configure:
   - Root Directory: `api`
   - Build Command: `npm install`
   - Start Command: `npm start`
4. Adicione a variavel de ambiente `DATABASE_URL` com a URL interna do PostgreSQL do Render.
5. Depois do deploy, use a URL gerada no app Flutter:

```bash
flutter run --dart-define=API_BASE_URL=https://sua-api.onrender.com
```
