import { PIPELINE_STAGES } from '../../domain/types';
import type { Candidate } from '../../domain/types';

function staleCount(candidates: Candidate[]) {
  const now = new Date().getTime();
  return candidates.filter((c) => (now - new Date(c.ultimoContacto).getTime()) / 86400000 > 7).length;
}

interface Props { candidates: Candidate[] }

export function Dashboard({ candidates }: Props) {
  const total = candidates.length;
  const entrevistasMarcadas = candidates.filter((c) => c.etapa === 'Entrevista marcada').length;
  const entrevistasRealizadas = candidates.filter((c) => c.etapa === 'Entrevista realizada').length;
  const aceites = candidates.filter((c) => c.etapa === 'Aceitou').length;
  const perdidos = candidates.filter((c) => c.etapa === 'Perdido').length;
  const paradas = staleCount(candidates);

  return (
    <section className="space-y-4">
      <h2 className="text-xl font-semibold">Dashboard operacional</h2>
      <div className="grid grid-cols-2 gap-3 md:grid-cols-6">
        <Kpi title="Total leads" value={total} />
        <Kpi title="Entrevistas marcadas" value={entrevistasMarcadas} />
        <Kpi title="Entrevistas realizadas" value={entrevistasRealizadas} />
        <Kpi title="Aceites" value={aceites} />
        <Kpi title="Perdidos" value={perdidos} />
        <Kpi title="Sem contacto +7d" value={paradas} alert={paradas > 0} />
      </div>
      <div className="rounded-xl border bg-white p-4">
        <h3 className="mb-3 font-medium">Leads por etapa</h3>
        <div className="grid grid-cols-2 gap-2 text-sm md:grid-cols-5">
          {PIPELINE_STAGES.map((stage) => (
            <div className="rounded-lg bg-slate-100 p-2" key={stage}>
              <div className="text-slate-600">{stage}</div>
              <div className="font-semibold">{candidates.filter((c) => c.etapa === stage).length}</div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}

function Kpi({ title, value, alert = false }: { title: string; value: number; alert?: boolean }) {
  return <div className={`rounded-xl border p-3 ${alert ? 'border-red-300 bg-red-50' : 'bg-white'}`}><p className="text-xs text-slate-500">{title}</p><p className="text-2xl font-bold text-slate-900">{value}</p></div>;
}
