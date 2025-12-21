# Gratech Super Brain - Copilot Instructions

## Project Overview
Gratech Super Brain is a unified AI intelligence gateway that orchestrates multiple powerful language models (DeepSeek-V3, Llama-3.1-405B, GPT-5) into a single cohesive interface. The project demonstrates a production-ready architecture using Azure Web Apps, Docker Containers, and FastAPI backend.

## Architecture
- **Frontend**: React + TypeScript + Vite + TailwindCSS (Single Page Application)
- **Backend**: Python 3.11 + FastAPI (REST API)
- **Infrastructure**: Azure Web App for Containers, Azure Container Registry
- **AI Integration**: Azure OpenAI Service with multiple model deployments

## Tech Stack

### Frontend
- **Framework**: React 18.2 with TypeScript
- **Build Tool**: Vite 5.1
- **Styling**: TailwindCSS 3.4
- **UI Components**: Custom components with Lucide React icons
- **Module System**: ES Modules

### Backend
- **Framework**: FastAPI
- **Python Version**: 3.11
- **Dependencies**: OpenAI SDK (Azure adapter), Pydantic, Uvicorn
- **API Design**: RESTful with CORS enabled for cross-origin requests

## Development Setup

### Frontend Development
```bash
npm install          # Install dependencies
npm run dev         # Start dev server (Vite)
npm run build       # Build for production
npm run preview     # Preview production build
```

### Backend Development
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload  # Start development server
```

### Environment Variables
The backend requires the following Azure API keys (configured in Azure App Settings):
- `DEEPSEEK_KEY`: For DeepSeek-V3 model
- `LLAMA_KEY`: For Llama-3.1-405B and GPT-5 models
- `AZURE_OPENAI_KEY`: For GPT-4o model

## Code Style and Conventions

### TypeScript/React
- Use TypeScript for all new React components
- Use functional components with hooks (no class components)
- Follow React 18 best practices
- Use ES2022 target with ESNext modules
- JSX transformer: `react-jsx`
- Path alias: `@/*` points to project root

### Python/FastAPI
- Follow PEP 8 style guidelines
- Use type hints with Pydantic models for request/response validation
- Use async/await for all endpoint handlers
- Configuration should be environment-based (no hardcoded secrets)
- Use descriptive variable names (e.g., `config`, `client`, `response`)

### File Organization
- Frontend code: Root directory (App.tsx, index.tsx, components/, types.ts)
- Backend code: `backend/` directory
- Configuration: Root level (package.json, tsconfig.json, vite.config.ts)

## Key Components and APIs

### Backend Endpoints
- `GET /`: Health check and available models list
- `POST /api/chat`: Main chat endpoint
  - Accepts: `message`, `model` (optional, defaults to "deepseek"), `system_prompt` (optional)
  - Returns: AI response with model and provider info

### Model Configuration
Models are configured in the `MODELS` dictionary in `backend/main.py`:
- `deepseek`: DeepSeek-V3 (Azure deployment: "DeepSeek-V3.1")
- `llama-405b`: Meta-Llama-3.1-405B-Instruct  
- `gpt-5`: GPT-5 chat preview
- `gpt-4o`: GPT-4o

Each model config includes: endpoint, API key reference, deployment name, and API version.

## Testing
- No automated test suite currently exists
- Manual testing through the frontend UI or direct API calls
- When adding features, ensure they work with existing Azure deployments

## Docker and Deployment
- Frontend and backend have separate Dockerfiles
- Frontend is built and served as static files
- Backend runs on uvicorn in production
- Deployed to Azure Web App for Containers

## Common Tasks

### Adding a New AI Model
1. Add configuration to `MODELS` dict in `backend/main.py`
2. Add corresponding environment variable for API key
3. Test with a sample request to verify deployment name and endpoint

### Modifying Frontend Components
1. Components use TypeScript with proper typing
2. State management uses React hooks
3. Styling uses TailwindCSS utility classes
4. Icons from Lucide React library

### Updating Dependencies
- Frontend: Update `package.json` and run `npm install`
- Backend: Update `requirements.txt` and run `pip install -r requirements.txt`

## Security Guidelines
- Never hardcode API keys or secrets
- Use Azure Key Vault or App Settings for sensitive data
- CORS is currently open (`allow_origins=["*"]`) - restrict in production
- Validate all user inputs through Pydantic models
- Use HTTPS for all production deployments

## Project-Specific Notes
- Default AI model is DeepSeek-V3 as specified in the ChatRequest model
- All models use Azure OpenAI endpoints (not direct OpenAI)
- Temperature is set to 0.7, max_tokens to 1000 for chat completions
- Frontend communicates with backend via REST API calls
