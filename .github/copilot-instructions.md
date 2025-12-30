# Copilot Instructions for Gratech AI Dashboard

## Project Overview
Gratech Super Brain is a unified AI intelligence gateway that orchestrates multiple language models (DeepSeek-V3, Llama-3.1-405B, GPT-5) into a single cohesive interface. This is a production-ready full-stack application deployed on Azure.

## Tech Stack

### Frontend
- **Framework**: React 18 with TypeScript
- **Build Tool**: Vite 5
- **Styling**: TailwindCSS 3
- **Icons**: lucide-react
- **Target**: ES2022, JSX: react-jsx

### Backend
- **Framework**: FastAPI (Python 3.11+)
- **AI Integration**: Azure OpenAI SDK
- **Server**: Uvicorn
- **Validation**: Pydantic

### Infrastructure
- **Containerization**: Docker (multi-stage builds)
- **Cloud**: Azure Web Apps, Azure Container Registry
- **Frontend Serving**: Nginx (Alpine)

## Development Commands

### Frontend Development
```bash
npm install          # Install dependencies
npm run dev          # Start development server (Vite)
npm run build        # Production build
npm run preview      # Preview production build
```

### Backend Development
```bash
cd backend
pip install -r requirements.txt
uvicorn main:app --reload  # Start with hot reload on port 8000
```

### Docker
```bash
docker build -t gratech-dashboard .
docker run -p 80:80 gratech-dashboard
```

## Coding Standards

### TypeScript/React
- Use functional components with TypeScript type annotations
- Prefer React.FC for component types
- Use hooks (useState, useEffect) for state management
- Follow the existing component structure in `/components` directory
- Components should be in PascalCase (e.g., `SuperBrain.tsx`)
- Use TailwindCSS utility classes for styling with a slate/dark theme
- Color scheme: bg-slate-950 (background), text-slate-200 (text), slate-800/900 (borders/cards)
- Maintain consistent spacing with `gap-*`, `p-*`, `mb-*` utilities

### Python/FastAPI
- Follow PEP 8 style guidelines
- Use Pydantic models for request/response validation
- Type hints are required for all function parameters and returns
- Use async/await for endpoint handlers
- Environment variables for sensitive data (API keys, endpoints)
- CORS is enabled for all origins (development mode)
- Error handling with HTTPException and appropriate status codes

### File Organization
- React components: `/components/*.tsx`
- Main app: `App.tsx`
- Entry point: `index.tsx`
- Backend: `/backend/main.py`
- Type definitions: `types.ts`
- Path alias `@/` points to project root

## Architecture Patterns

### Frontend
- Component-based architecture with clear separation of concerns
- Each major feature is a separate component (SuperBrain, DNSMonitor, StatusCards, etc.)
- Shared state through props; local state with useState
- Real-time UI updates using intervals/timers
- Responsive design with Tailwind breakpoints (sm, md, lg)

### Backend
- RESTful API design
- Multiple AI model configurations in MODELS dictionary
- Dynamic client instantiation per request
- Centralized error handling
- Model selection via request body parameter

### API Integration
- Base endpoint: `/api/chat` (POST)
- Request format: `{ message: string, model: string, system_prompt: string }`
- Response format: `{ response: string, model: string, provider: string }`
- Available models: deepseek, llama-405b, gpt-5, gpt-4o

## Security Considerations
- **Never commit API keys or secrets** - Use environment variables
- API keys stored in Azure App Settings (DEEPSEEK_KEY, LLAMA_KEY, AZURE_OPENAI_KEY)
- CORS configured for development; restrict in production
- Use HTTPS endpoints for Azure services
- Validate all user inputs with Pydantic models

## Testing
- No formal test infrastructure currently exists
- Manual testing via development servers
- Test AI endpoints individually before multi-model integration
- Verify Docker builds before deployment

## Deployment
- Frontend: Static build served via Nginx on port 80
- Multi-stage Docker build (node builder → nginx runtime)
- Vite base path set to `/gratech-ai-dashboard/`
- Azure deployment via Container Registry
- Live URL: https://gratech-dash-live.azurewebsites.net

## Common Patterns

### Adding a New Component
1. Create `.tsx` file in `/components` directory
2. Export as named export
3. Import in `App.tsx`
4. Follow existing dark theme styling (slate colors)
5. Use lucide-react for icons

### Adding a New AI Model
1. Add configuration to MODELS dictionary in `backend/main.py`
2. Include endpoint, key reference, deployment name, API version
3. Update available_models in root endpoint response
4. Test with `/api/chat` endpoint

### Styling Guidelines
- Primary background: `bg-slate-950`
- Card backgrounds: `bg-slate-900`
- Borders: `border-slate-800` or `border-slate-700`
- Text: `text-slate-200` (primary), `text-slate-400` (secondary)
- Accent colors: cyan-400/500, green-500, yellow-500
- Status indicators: green (online), yellow (pending), red (error)
- Use `rounded-xl` for cards, `rounded-lg` for buttons
- Shadows: `shadow-lg` for elevated components

## Dependencies Management
- Frontend: Use npm (package-lock.json committed)
- Backend: Use pip with requirements.txt
- Keep dependencies minimal and up-to-date
- Prefer stable versions over latest

## Documentation
- Update README.md for major feature changes
- Include inline comments for complex logic only
- Document API endpoints and model configurations
- Keep deployment instructions current

## Known Conventions
- Time display uses `toLocaleTimeString()` with UTC+03
- Domain references: api.gratech.sa, gratech-dash-live.azurewebsites.net
- Company branding: "Powered by Gratech.sa"
- Developer: Sulaiman Alshammari
