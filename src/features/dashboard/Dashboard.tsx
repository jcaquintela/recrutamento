import { PIPELINE_STAGES } from '../../domain/types';
import type { Candidate } from '../../domain/types';

interface Props { candidates: Candidate[] }

export function Dashboard({ candidates }: Props) {
  const total = candidates.length;
  const entrevistasMarcadas = candidates.filter((c) => c.etapa === 'Entrevista marcada').length;
  const entrevistasRealizadas = candidates.filter((c) => c.etapa === 'Entrevista realizada').length;
  const aceites = candidates.filter((c) => c.etapa === 'Aceitou').length;
  const perdidos = candidates.filter((c) => c.etapa === 'Perdido').length;

  return (
    <section className="space-y-4">
      <h2 className="text-xl font-semibold">Dashboard operacional</h2>
      <div className="grid grid-cols-2 gap-3 md:grid-cols-5">
        <Kpi title="Total leads" value={total} />
        <Kpi title="Entrevistas marcadas" value={entrevistasMarcadas} />
        <Kpi title="Entrevistas realizadas" value={entrevistasRealizadas} />
        <Kpi title="Aceites" value={aceites} />
        <Kpi title="Perdidos" value={perdidos} />
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

function Kpi({ title, value }: { title: string; value: number }) {
  return (
    <div className="rounded-xl border bg-white p-3">
      <p className="text-xs text-slate-500">{title}</p>
      <p className="text-2xl font-bold text-slate-900">{value}</p>
    </div>
  );
}
