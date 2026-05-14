import { useMemo, useState } from 'react';
import { Dashboard } from './features/dashboard/Dashboard';
import { mockCandidates } from './mocks/candidates';
import type { CandidateFilters } from './domain/types';
import { CandidateFilters as Filters } from './features/candidates/CandidateFilters';
import { CandidatesTable } from './features/candidates/CandidatesTable';

const initialFilters: CandidateFilters = {
  query: '',
  etapa: 'Todos',
  fonte: 'Todos',
  score: 'Todos',
  owner: 'Todos',
  hub: 'Todos'
};

function App() {
  const [filters, setFilters] = useState<CandidateFilters>(initialFilters);

  const owners = Array.from(new Set(mockCandidates.map((candidate) => candidate.owner)));
  const hubs = Array.from(new Set(mockCandidates.map((candidate) => candidate.hubPretendido)));

  const filtered = useMemo(() => {
    return mockCandidates.filter((candidate) => {
      const haystack = `${candidate.nome} ${candidate.email} ${candidate.telefone}`.toLowerCase();
      const queryMatch = haystack.includes(filters.query.toLowerCase());
      const etapaMatch = filters.etapa === 'Todos' || candidate.etapa === filters.etapa;
      const fonteMatch = filters.fonte === 'Todos' || candidate.fonte === filters.fonte;
      const scoreMatch = filters.score === 'Todos' || candidate.score === filters.score;
      const ownerMatch = filters.owner === 'Todos' || candidate.owner === filters.owner;
      const hubMatch = filters.hub === 'Todos' || candidate.hubPretendido === filters.hub;
      return queryMatch && etapaMatch && fonteMatch && scoreMatch && ownerMatch && hubMatch;
    });
  }, [filters]);

  return (
    <div className="mx-auto min-h-screen max-w-7xl bg-slate-50 p-4 md:p-6">
      <header className="mb-6">
        <h1 className="text-2xl font-bold md:text-3xl">ZomeRecruta</h1>
        <p className="text-sm text-slate-600 md:text-base">MVP operacional de recrutamento para Hub Directors.</p>
      </header>

      <main className="space-y-6">
        <Dashboard candidates={filtered} />
        <Filters filters={filters} hubs={hubs} owners={owners} onChange={setFilters} />
        <CandidatesTable candidates={filtered} />
      </main>
    </div>
  );
}

export default App;
