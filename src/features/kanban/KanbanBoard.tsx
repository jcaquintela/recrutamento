import { PIPELINE_STAGES } from '../../domain/types';
import type { Candidate, PipelineStage } from '../../domain/types';

interface Props {
  candidates: Candidate[];
  selectedId?: string;
  onSelect: (id: string) => void;
  onMove: (id: string, stage: PipelineStage) => void;
}

export function KanbanBoard({ candidates, selectedId, onSelect, onMove }: Props) {
  return (
    <section className="rounded-xl border bg-white p-4">
      <h3 className="mb-3 font-medium">Kanban do funil</h3>
      <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-5">
        {PIPELINE_STAGES.map((stage) => (
          <div key={stage} className="rounded-lg bg-slate-50 p-2">
            <div className="mb-2 text-xs font-semibold text-slate-600">{stage}</div>
            <div className="space-y-2">
              {candidates.filter((c) => c.etapa === stage).map((candidate) => (
                <button
                  key={candidate.id}
                  onClick={() => onSelect(candidate.id)}
                  className={`w-full rounded-lg border p-2 text-left text-sm ${selectedId === candidate.id ? 'border-blue-500 bg-blue-50' : 'bg-white'}`}
                >
                  <div className="font-medium">{candidate.nome}</div>
                  <select
                    className="mt-1 w-full rounded border p-1 text-xs"
                    value={candidate.etapa}
                    onChange={(e) => onMove(candidate.id, e.target.value as PipelineStage)}
                  >
                    {PIPELINE_STAGES.map((option) => <option key={option}>{option}</option>)}
                  </select>
                </button>
              ))}
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
