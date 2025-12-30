# 🧠 Gratech Super Brain
### The Unified AI Intelligence Gateway

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

## 🚀 Overview
**Gratech Super Brain** is a next-generation AI dashboard that orchestrates the world's most powerful language models into a single, cohesive interface. Instead of relying on a single AI provider, this system leverages a "Council of Minds" approach:

*   **DeepSeek-V3:** For deep reasoning and code generation.
*   **Llama-3.1-405B:** For broad knowledge and open-source intelligence.
*   **GPT-5 (Preview):** For state-of-the-art conversational context and nuance.

This project demonstrates a production-ready architecture using **Azure Web Apps**, **Docker Containers**, and a **FastAPI** backend, fully secured and scalable.

## ✨ Key Features
*   **Unified API Gateway:** A single endpoint to query multiple AI giants.
*   **Real-Time Intelligence:** Low-latency responses optimized via Azure Cloud.
*   **Secure Architecture:** Enterprise-grade security with Azure Key Vault & App Settings (No hardcoded secrets).
*   **Modern UI:** A sleek, responsive React frontend for seamless interaction.

## 🛠️ Tech Stack
*   **Frontend:** React, TypeScript, Vite, TailwindCSS.
*   **Backend:** Python 3.11, FastAPI, OpenAI SDK (Azure Adapter).
*   **Infrastructure:** Azure Web App for Containers, Azure Container Registry (ACR).
*   **DevOps:** Docker, Git.

## 🌐 Live Demo
Access the live Super Brain dashboard here:
[**Launch Gratech Super Brain**](https://gratech-dash-live.azurewebsites.net)

## 📦 Installation & Setup

### Prerequisites
*   Docker
*   Python 3.11+
*   Node.js 18+
*   Azure CLI (for Azure deployment)

### Local Development
1.  **Clone the repository:**
    ```bash
    git clone https://github.com/GrAxOS/gratech-ai-dashboard.git
    cd gratech-ai-dashboard
    ```
2.  **Configure Environment Variables:**
    Create a `.env` file in the backend directory with your Azure AI API keys:
    ```bash
    DEEPSEEK_KEY=your_deepseek_api_key
    LLAMA_KEY=your_llama_api_key
    AZURE_OPENAI_KEY=your_azure_openai_api_key
    ```
3.  **Backend Setup:**
    ```bash
    cd backend
    pip install -r requirements.txt
    uvicorn main:app --reload
    ```
4.  **Frontend Setup:**
    Open a new terminal in the project root directory:
    ```bash
    npm install
    npm run dev
    ```

### Docker Deployment

**Frontend Container:**
```bash
docker build -t gratech-dashboard-frontend .
docker run -p 80:80 gratech-dashboard-frontend
```

**Backend Container:**
```bash
cd backend
docker build -t gratech-dashboard-backend .
docker run -p 8000:8000 \
  -e DEEPSEEK_KEY=your_key \
  -e LLAMA_KEY=your_key \
  -e AZURE_OPENAI_KEY=your_key \
  gratech-dashboard-backend
```

## 📡 API Documentation

The backend exposes the following endpoints:

### GET /
Health check endpoint that returns system status and available models.

**Response:**
```json
{
  "status": "online",
  "system": "Gratech Super Brain",
  "available_models": ["deepseek", "llama-405b", "gpt-5", "gpt-4o"]
}
```

### POST /api/chat
Send a message to one of the available AI models.

**Request Body:**
```json
{
  "message": "Your question here",
  "model": "deepseek",
  "system_prompt": "You are Gratech AI, a super-intelligent assistant."
}
```

**Response:**
```json
{
  "response": "AI response here",
  "model": "DeepSeek-V3.1",
  "provider": "Azure AI Foundry"
}
```

**Available Models:**
- `deepseek` - DeepSeek-V3.1 (default)
- `llama-405b` - Meta-Llama-3.1-405B-Instruct
- `gpt-5` - GPT-5 Chat (Preview)
- `gpt-4o` - GPT-4o

## 🤝 Contributing
Open source is at the heart of innovation. Feel free to fork this repository, submit Pull Requests, or suggest new features.

---
*Built with ❤️ by Gratech*
