# GrAtech AI Dashboard

Elevator pitch (1 line)
A secure, enterprise-grade real-time infrastructure monitoring dashboard with RAG-powered insights and Azure-ready deployment automation.

Quick links
- Live demo: (after publishing, link will be added)
- PRs: (links will be added after PRs are created)

How to run locally (quick)
1. Copy .env.example → .env.local and fill variables
2. Build & run with Docker Compose:
   docker compose up --build
3. Frontend: http://localhost:3000
   Backend API: http://localhost:9000

Repository structure
- /frontend  — Vite / React (TypeScript)
- /backend   — FastAPI (Python)
- /infra     — Terraform skeleton
- /seed      — demo dataset + seed script
- .github/workflows — CI/CD

Demo dataset & seed
- run: node ./seed/seed.js  (or python ./seed/seed.py)

Contributing
- Open an issue or PR; tests run on each PR.

License
- MIT

(More details like screenshots, GIFs and link demo will be added after publishing.)
