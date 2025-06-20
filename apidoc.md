# Pet Adoption API Documentation

This REST API provides endpoints for managing a pet adoption application, including listing pets, searching and filtering pets, adopting pets, managing favorites, and viewing adoption history.

---

## Base URL

```
http://<your-server>:3000/api
```

---

## Endpoints

### 1. Get All Pets

Retrieve a paginated list of pets with optional search and filtering.

- **URL:** `/pets`
- **Method:** `GET`
- **Query Parameters:**
  - `page` (optional, integer, default: 1): Page number for pagination.
  - `limit` (optional, integer, default: 10): Number of pets per page.
  - `search` (optional, string): Search pets by name (case-insensitive).
  - `breed` (optional, string): Filter by pet breed (e.g., "Labrador").
  - `gender` (optional, string): Filter by pet gender (e.g., "Male", "Female").
  - `minAge` (optional, integer): Minimum pet age.
  - `maxAge` (optional, integer): Maximum pet age.
  - `minPrice` (optional, integer): Minimum pet price.
  - `maxPrice` (optional, integer): Maximum pet price.

#### Response:

- **Status:** `200 OK`

```json
{
  "pets": [
    {
      "_id": "string",
      "name": "string",
      "age": number,
      "price": number,
      "image": "string",
      "breed": "string",
      "gender": "string",
      "isAdopted": boolean,
      "adoptionDate": "string (ISO 8601)" | null,
      "isFavorite": boolean
    }
  ],
  "total": number,
  "pages": number,
  "currentPage": number
}
```

#### Errors:

- `500 Internal Server Error`

```json
{ "error": "string" }
```

#### Example:

```json
{
  "pets": [
    {
      "_id": "1234567890abcdef12345678",
      "name": "Max",
      "age": 2,
      "price": 200,
      "image": "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e",
      "breed": "Labrador",
      "gender": "Male",
      "isAdopted": false,
      "adoptionDate": null,
      "isFavorite": false
    }
  ],
  "total": 1,
  "pages": 1,
  "currentPage": 1
}
```

---

### 2. Get Pet by ID

Retrieve details of a specific pet by its ID.

- **URL:** `/pets/:id`
- **Method:** `GET`
- **URL Parameters:**
  - `id` (required, string): MongoDB ObjectId of the pet.

#### Response:

- **Status:** `200 OK`

```json
{
  "_id": "string",
  "name": "string",
  "age": number,
  "price": number,
  "image": "string",
  "breed": "string",
  "gender": "string",
  "isAdopted": boolean,
  "adoptionDate": "string (ISO 8601)" | null,
  "isFavorite": boolean
}
```

#### Errors:

- `404 Not Found`

```json
{ "error": "Pet not found" }
```

- `500 Internal Server Error`

```json
{ "error": "string" }
```

#### Example:

```json
{
  "_id": "1234567890abcdef12345678",
  "name": "Max",
  "age": 2,
  "price": 200,
  "image": "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e",
  "breed": "Labrador",
  "gender": "Male",
  "isAdopted": false,
  "adoptionDate": null,
  "isFavorite": false
}
```

---

### 3. Adopt a Pet

Mark a pet as adopted and record the adoption in history.

- **URL:** `/pets/:id/adopt`
- **Method:** `POST`
- **URL Parameters:**
  - `id` (required, string): MongoDB ObjectId of the pet.

- **Request Body:** None

#### Response:

- **Status:** `200 OK`

```json
{
  "message": "You've now adopted <pet_name>",
  "pet": {
    "_id": "string",
    "name": "string",
    "age": number,
    "price": number,
    "image": "string",
    "breed": "string",
    "gender": "string",
    "isAdopted": true,
    "adoptionDate": "string (ISO 8601)",
    "isFavorite": boolean
  }
}
```

#### Errors:

- `400 Bad Request`

```json
{ "error": "Pet already adopted" }
```

- `404 Not Found`

```json
{ "error": "Pet not found" }
```

- `500 Internal Server Error`

```json
{ "error": "string" }
```

#### Example:

```json
{
  "message": "You've now adopted Max",
  "pet": {
    "_id": "1234567890abcdef12345678",
    "name": "Max",
    "age": 2,
    "price": 200,
    "image": "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e",
    "breed": "Labrador",
    "gender": "Male",
    "isAdopted": true,
    "adoptionDate": "2025-06-20T09:42:00.000Z",
    "isFavorite": false
  }
}
```

---

### 4. Toggle Favorite Status

Toggle the favorite status of a pet.

- **URL:** `/pets/:id/favorite`
- **Method:** `POST`
- **URL Parameters:**
  - `id` (required, string): MongoDB ObjectId of the pet.

- **Request Body:** None

#### Response:

- **Status:** `200 OK`

```json
{
  "_id": "string",
  "name": "string",
  "age": number,
  "price": number,
  "image": "string",
  "breed": "string",
  "gender": "string",
  "isAdopted": boolean,
  "adoptionDate": "string (ISO 8601)" | null,
  "isFavorite": boolean
}
```

#### Errors:

- `404 Not Found`

```json
{ "error": "Pet not found" }
```

- `500 Internal Server Error`

```json
{ "error": "string" }
```
