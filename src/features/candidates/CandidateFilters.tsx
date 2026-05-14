import { PIPELINE_STAGES, SCORES, SOURCES } from '../../domain/types';
import type { CandidateFilters as Filters } from '../../domain/types';

interface Props {
  filters: Filters;
  hubs: string[];
  owners: string[];
  onChange: (next: Filters) => void;
}

export function CandidateFilters({ filters, hubs, owners, onChange }: Props) {
  return (
    <section className="rounded-xl border bg-white p-4">
      <h3 className="mb-3 font-medium">Filtros</h3>
      <div className="grid gap-3 md:grid-cols-3 lg:grid-cols-6">
        <input className="field lg:col-span-2" placeholder="Pesquisar nome, email, telefone" value={filters.query} onChange={(e) => onChange({ ...filters, query: e.target.value })} />
        <Select value={filters.etapa} options={['Todos', ...PIPELINE_STAGES]} onChange={(etapa) => onChange({ ...filters, etapa: etapa as Filters['etapa'] })} />
        <Select value={filters.fonte} options={['Todos', ...SOURCES]} onChange={(fonte) => onChange({ ...filters, fonte: fonte as Filters['fonte'] })} />
        <Select value={filters.score} options={['Todos', ...SCORES]} onChange={(score) => onChange({ ...filters, score: score as Filters['score'] })} />
        <Select value={filters.owner} options={['Todos', ...owners]} onChange={(owner) => onChange({ ...filters, owner })} />
        <Select value={filters.hub} options={['Todos', ...hubs]} onChange={(hub) => onChange({ ...filters, hub })} />
      </div>
    </section>
  );
}

function Select({ value, options, onChange }: { value: string; options: string[]; onChange: (value: string) => void }) {
  return (
    <select className="field" value={value} onChange={(e) => onChange(e.target.value)}>
      {options.map((option) => (
        <option key={option} value={option}>{option}</option>
      ))}
    </select>
  );
}
