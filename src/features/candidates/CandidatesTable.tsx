import type { Candidate } from '../../domain/types';

export function CandidatesTable({ candidates }: { candidates: Candidate[] }) {
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
              <th className="p-2">Nome</th><th className="p-2">Etapa</th><th className="p-2">Score</th><th className="p-2">Fonte</th><th className="p-2">Owner</th><th className="p-2">Hub</th><th className="p-2">Último contacto</th><th className="p-2">Próxima ação</th>
            </tr>
          </thead>
          <tbody>
            {candidates.map((candidate) => (
              <tr className="border-b" key={candidate.id}>
                <td className="p-2 font-medium">{candidate.nome}<div className="text-xs text-slate-500">{candidate.email}</div></td>
                <td className="p-2">{candidate.etapa}</td><td className="p-2">{candidate.score}</td><td className="p-2">{candidate.fonte}</td><td className="p-2">{candidate.owner}</td><td className="p-2">{candidate.hubPretendido}</td><td className="p-2">{candidate.ultimoContacto}</td><td className="p-2">{candidate.proximaAcao}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </section>
  );
}
