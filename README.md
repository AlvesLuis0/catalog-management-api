# Catalog Management API

Catalog Management is a backend service designed to manage catalogs, categories, and products for e-commerce applications. Authentication is handled via JWT tokens. This project uses Rails and is fully documented via Swagger (OpenAPI 3.0.3).

## Features

* JWT-based authentication
* Catalog retrieval by owner
* CRUD operations for categories and products
* Health check endpoint
* API documentation via Swagger

## Getting Started

### Requirements

* Ruby 3.4.2
* Rails 8.0.2
* PostgreSQL 17.5

### Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/your-org/catalog-management-api.git
cd catalog-management-api
```

2. **Install dependencies**

```bash
bundle install
```

3. **Database setup**

```bash
rails db:prepare
```

4. **Environment variables**
   Set up the following environment variables:

* `SECRET_KEY_BASE`
* `JWT_SECRET_KEY`
* `HOST (default 'localhost')`
* `PORT (default '3000')`
* `POSTGRES_USERNAME`
* `POSTGRES_PASSWORD`
* `POSTGRES_HOST (default 'localhost')`
* `POSTGRES_PORT (default '5432')`
* `AWS_REGION`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SNS_TOPIC_ARN`
* `AWS_BUCKET_NAME`

5. **Run the server**

```bash
rails server
```

6. **Access API documentation**
   Swagger documentation is available at `/api-docs`.

### Running Tests

```bash
rails spec
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your fork
5. Open a Pull Request

## License

This project is licensed under the MIT License.

---

API request/response details are available in the [Swagger Documentation](./swagger/v1/swagger.yaml).
