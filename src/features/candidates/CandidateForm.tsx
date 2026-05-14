import { PIPELINE_STAGES, SOURCES } from '../../domain/types';
import type { Candidate, CandidateProfileAnswers } from '../../domain/types';

type CandidateInput = Omit<Candidate, 'interactions' | 'tasks'>;

interface Props {
  value: CandidateInput;
  onChange: (next: CandidateInput) => void;
  onSave: () => void;
  onCancel: () => void;
}

const profileFields: { key: keyof CandidateProfileAnswers; label: string }[] = [
  { key: 'experienciaComercial', label: 'Experiência comercial' },
  { key: 'motivacao', label: 'Motivação para imobiliário' },
  { key: 'disponibilidade', label: 'Disponibilidade' },
  { key: 'urgencia', label: 'Urgência' },
  { key: 'investimentoInicial', label: 'Investimento inicial' },
  { key: 'qualidadeResposta', label: 'Qualidade da resposta' },
  { key: 'aberturaEntrevista', label: 'Abertura para entrevista' }
];

export function CandidateForm({ value, onChange, onSave, onCancel }: Props) {
  return (
    <section className="rounded-xl border bg-white p-4">
      <h3 className="mb-3 font-medium">{value.id ? 'Editar candidato' : 'Novo candidato'}</h3>
      <div className="grid gap-2 md:grid-cols-2">
        {['nome', 'telefone', 'email', 'hubPretendido', 'owner', 'proximaAcao'].map((field) => (
          <input key={field} className="field" placeholder={field} value={value[field as keyof CandidateInput] as string}
            onChange={(e) => onChange({ ...value, [field]: e.target.value })} />
        ))}
        <select className="field" value={value.fonte} onChange={(e) => onChange({ ...value, fonte: e.target.value as Candidate['fonte'] })}>{SOURCES.map((s) => <option key={s}>{s}</option>)}</select>
        <select className="field" value={value.etapa} onChange={(e) => onChange({ ...value, etapa: e.target.value as Candidate['etapa'] })}>{PIPELINE_STAGES.map((s) => <option key={s}>{s}</option>)}</select>
        <input className="field" type="date" value={value.dataEntradaLead} onChange={(e) => onChange({ ...value, dataEntradaLead: e.target.value })} />
        <input className="field" type="date" value={value.ultimoContacto} onChange={(e) => onChange({ ...value, ultimoContacto: e.target.value })} />
        {profileFields.map(({ key, label }) => (
          <label key={key} className="text-sm">{label}
            <input className="field mt-1" type="range" min={1} max={5} value={value.profile[key]} onChange={(e) => onChange({ ...value, profile: { ...value.profile, [key]: Number(e.target.value) } })} />
            <span className="text-xs text-slate-500">{value.profile[key]}/5</span>
          </label>
        ))}
        <textarea className="field md:col-span-2" placeholder="notas" value={value.notas} onChange={(e) => onChange({ ...value, notas: e.target.value })} />
      </div>
      <div className="mt-3 flex gap-2">
        <button className="rounded bg-blue-600 px-3 py-2 text-sm text-white" onClick={onSave}>Guardar</button>
        <button className="rounded border px-3 py-2 text-sm" onClick={onCancel}>Cancelar</button>
      </div>
    </section>
  );
}
