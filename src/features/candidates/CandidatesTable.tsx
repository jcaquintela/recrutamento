import type { Candidate } from '../../domain/types';

function isStale(date: string) {
  const last = new Date(date).getTime();
  const now = new Date().getTime();
  return (now - last) / (1000 * 60 * 60 * 24) > 7;
}

export function CandidatesTable({ candidates, onSelect }: { candidates: Candidate[]; onSelect: (id: string) => void }) {
  return (
    <section className="rounded-xl border bg-white p-4">
      <div className="mb-3 flex items-center justify-between">
        <h3 className="font-medium">Candidatos</h3>
        <span className="text-sm text-slate-500">{candidates.length} resultado(s)</span>
      </div>
      <div className="overflow-x-auto">
        <table className="min-w-full text-sm">
          <thead>
            <tr className="border-b text-left text-slate-500">
              <th className="p-2">Nome</th><th className="p-2">Etapa</th><th className="p-2">Score</th><th className="p-2">Owner</th><th className="p-2">Último contacto</th><th className="p-2">Alerta</th>
            </tr>
          </thead>
          <tbody>
            {candidates.map((candidate) => {
              const stale = isStale(candidate.ultimoContacto);
              return (
              <tr className={`border-b ${stale ? 'bg-red-50' : ''}`} key={candidate.id} onClick={() => onSelect(candidate.id)}>
                <td className="cursor-pointer p-2 font-medium">{candidate.nome}<div className="text-xs text-slate-500">{candidate.email}</div></td>
                <td className="p-2">{candidate.etapa}</td><td className="p-2">{candidate.score}</td><td className="p-2">{candidate.owner}</td><td className="p-2">{candidate.ultimoContacto}</td><td className="p-2">{stale ? '⚠️ +7 dias sem contacto' : '—'}</td>
              </tr>
            )})}
          </tbody>
        </table>
      </div>
    </section>
  );
}
