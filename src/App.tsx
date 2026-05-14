import { useMemo, useState } from 'react';
import { Dashboard } from './features/dashboard/Dashboard';
import { mockCandidates } from './mocks/candidates';
import type { Candidate, CandidateFilters, Interaction, PipelineStage } from './domain/types';
import { calculateScore } from './domain/scoring';
import { CandidateFilters as Filters } from './features/candidates/CandidateFilters';
import { CandidatesTable } from './features/candidates/CandidatesTable';
import { KanbanBoard } from './features/kanban/KanbanBoard';
import { CandidateDetail } from './features/candidates/CandidateDetail';
import { CandidateForm } from './features/candidates/CandidateForm';

const initialFilters: CandidateFilters = { query: '', etapa: 'Todos', fonte: 'Todos', score: 'Todos', owner: 'Todos', hub: 'Todos' };

const emptyCandidate: Omit<Candidate, 'interactions' | 'tasks'> = {
  id: '', nome: '', telefone: '', email: '', fonte: 'Digital', hubPretendido: '', owner: '', etapa: 'Nova lead', score: 'Bronze', scoreJustification: '', profile: { experienciaComercial: 3, motivacao: 3, disponibilidade: 3, urgencia: 3, investimentoInicial: 3, qualidadeResposta: 3, aberturaEntrevista: 3 }, dataEntradaLead: new Date().toISOString().slice(0, 10), ultimoContacto: new Date().toISOString().slice(0, 10), proximaAcao: '', notas: ''
};

function App() {
  const [candidates, setCandidates] = useState<Candidate[]>(mockCandidates);
  const [filters, setFilters] = useState<CandidateFilters>(initialFilters);
  const [selectedId, setSelectedId] = useState<string | undefined>(candidates[0]?.id);
  const [editing, setEditing] = useState<Omit<Candidate, 'interactions' | 'tasks'> | null>(null);

  const owners = Array.from(new Set(candidates.map((candidate) => candidate.owner).filter(Boolean)));
  const hubs = Array.from(new Set(candidates.map((candidate) => candidate.hubPretendido).filter(Boolean)));

  const filtered = useMemo(() => candidates.filter((candidate) => {
    const haystack = `${candidate.nome} ${candidate.email} ${candidate.telefone}`.toLowerCase();
    return haystack.includes(filters.query.toLowerCase())
      && (filters.etapa === 'Todos' || candidate.etapa === filters.etapa)
      && (filters.fonte === 'Todos' || candidate.fonte === filters.fonte)
      && (filters.score === 'Todos' || candidate.score === filters.score)
      && (filters.owner === 'Todos' || candidate.owner === filters.owner)
      && (filters.hub === 'Todos' || candidate.hubPretendido === filters.hub);
  }), [candidates, filters]);

  const selected = candidates.find((candidate) => candidate.id === selectedId);

  const moveStage = (id: string, stage: PipelineStage) => setCandidates((prev) => prev.map((c) => c.id === id ? { ...c, etapa: stage } : c));

  const saveCandidate = () => {
    if (!editing) return;
    const scoring = calculateScore(editing.profile);
    if (editing.id) setCandidates((prev) => prev.map((c) => c.id === editing.id ? { ...c, ...editing, ...scoring } : c));
    else {
      const id = `cand-${Math.random().toString(36).slice(2, 7)}`;
      setCandidates((prev) => [{ ...editing, ...scoring, id, interactions: [], tasks: [] }, ...prev]);
      setSelectedId(id);
    }
    setEditing(null);
  };

  const addInteraction = (candidateId: string, interaction: Omit<Interaction, 'id'>) => setCandidates((prev) => prev.map((c) => c.id === candidateId ? { ...c, interactions: [{ ...interaction, id: crypto.randomUUID() }, ...c.interactions], ultimoContacto: interaction.date } : c));
  const toggleTask = (candidateId: string, taskId: string) => setCandidates((prev) => prev.map((c) => c.id !== candidateId ? c : { ...c, tasks: c.tasks.map((t) => t.id === taskId ? { ...t, done: !t.done } : t) }));
  const addTask = (candidateId: string, title: string, dueDate: string) => setCandidates((prev) => prev.map((c) => c.id === candidateId ? { ...c, tasks: [{ id: crypto.randomUUID(), title, dueDate, done: false }, ...c.tasks] } : c));

  return (
    <div className="mx-auto min-h-screen max-w-7xl bg-slate-50 p-4 md:p-6">
      <header className="mb-4 flex items-center justify-between"><div><h1 className="text-2xl font-bold md:text-3xl">ZomeRecruta</h1><p className="text-sm text-slate-600">Versão operacional MVP.</p></div><button className="rounded bg-blue-600 px-3 py-2 text-sm text-white" onClick={() => setEditing({ ...emptyCandidate })}>+ Candidato</button></header>
      <main className="space-y-6">
        <Dashboard candidates={filtered} />
        <Filters filters={filters} hubs={hubs} owners={owners} onChange={setFilters} />
        {editing && <CandidateForm value={editing} onChange={setEditing} onSave={saveCandidate} onCancel={() => setEditing(null)} />}
        <KanbanBoard candidates={filtered} selectedId={selectedId} onSelect={setSelectedId} onMove={moveStage} />
        <CandidatesTable candidates={filtered} onSelect={setSelectedId} />
        <div className="grid gap-4 lg:grid-cols-2">
          <CandidateDetail candidate={selected} onAddInteraction={addInteraction} onToggleTask={toggleTask} onAddTask={addTask} />
          {selected && <section className="rounded-xl border bg-white p-4"><h3 className="mb-2 font-medium">Ações rápidas</h3><button className="mr-2 rounded border px-2 py-1 text-xs" onClick={() => setEditing(selected)}>Editar</button></section>}
        </div>
      </main>
    </div>
  );
}

export default App;
