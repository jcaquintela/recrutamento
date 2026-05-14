import type { Candidate, Interaction } from '../../domain/types';

interface Props {
  candidate?: Candidate;
  onAddInteraction: (candidateId: string, interaction: Omit<Interaction, 'id'>) => void;
  onToggleTask: (candidateId: string, taskId: string) => void;
  onAddTask: (candidateId: string, title: string, dueDate: string) => void;
}

export function CandidateDetail({ candidate, onAddInteraction, onToggleTask, onAddTask }: Props) {
  if (!candidate) return <section className="rounded-xl border bg-white p-4 text-sm text-slate-500">Seleciona um candidato para ver a ficha.</section>;

  return (
    <section className="rounded-xl border bg-white p-4">
      <h3 className="font-medium">Ficha de candidato</h3>
      <p className="text-sm text-slate-600">{candidate.nome} · {candidate.email} · {candidate.telefone}</p>
      <p className="mt-2 text-sm">Último contacto: <span className="font-medium">{candidate.ultimoContacto}</span></p>
      <p className="text-sm">Próxima ação: {candidate.proximaAcao}</p>
      <p className="mt-2 text-sm">Score atual: <span className="font-semibold">{candidate.score}</span></p>
      <p className="text-sm text-slate-700">{candidate.scoreJustification}</p>
      <p className="mt-2 text-sm">Notas: {candidate.notas}</p>

      <div className="mt-4 grid gap-4 md:grid-cols-2">
        <div>
          <h4 className="mb-2 text-sm font-semibold">Histórico de interações</h4>
          <ul className="space-y-1 text-sm">
            {candidate.interactions.map((it) => <li key={it.id} className="rounded bg-slate-50 p-2">{it.date} · {it.type} · {it.note}</li>)}
          </ul>
          <button className="mt-2 rounded border px-2 py-1 text-xs" onClick={() => onAddInteraction(candidate.id, { date: new Date().toISOString().slice(0, 10), type: 'Nota', note: 'Follow-up registado.' })}>+ interação</button>
        </div>
        <div>
          <h4 className="mb-2 text-sm font-semibold">Tarefas</h4>
          <ul className="space-y-1 text-sm">
            {candidate.tasks.map((task) => (
              <li key={task.id} className="flex items-center justify-between rounded bg-slate-50 p-2">
                <span>{task.title} ({task.dueDate})</span>
                <input type="checkbox" checked={task.done} onChange={() => onToggleTask(candidate.id, task.id)} />
              </li>
            ))}
          </ul>
          <button className="mt-2 rounded border px-2 py-1 text-xs" onClick={() => onAddTask(candidate.id, 'Nova tarefa', new Date().toISOString().slice(0, 10))}>+ tarefa</button>
        </div>
      </div>
    </section>
  );
}
