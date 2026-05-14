export const PIPELINE_STAGES = [
  'Nova lead',
  'Contactado',
  'Qualificado',
  'Entrevista marcada',
  'Entrevista realizada',
  'Proposta feita',
  'Aceitou',
  'Azimute Zero',
  'Entrada no Hub',
  'Perdido'
] as const;

export const SOURCES = ['CIP', 'MGM', 'Digital', 'Referral', 'Evento', 'Outro'] as const;
export const SCORES = ['Ouro', 'Prata', 'Bronze'] as const;

export type PipelineStage = (typeof PIPELINE_STAGES)[number];
export type Source = (typeof SOURCES)[number];
export type Score = (typeof SCORES)[number];

export interface Interaction {
  id: string;
  date: string;
  type: 'Chamada' | 'Email' | 'Entrevista' | 'Nota';
  note: string;
}

export interface Task {
  id: string;
  title: string;
  dueDate: string;
  done: boolean;
}

export interface Candidate {
  id: string;
  nome: string;
  telefone: string;
  email: string;
  fonte: Source;
  hubPretendido: string;
  owner: string;
  etapa: PipelineStage;
  score: Score;
  dataEntradaLead: string;
  ultimoContacto: string;
  proximaAcao: string;
  notas: string;
  interactions: Interaction[];
  tasks: Task[];
}

export interface CandidateFilters {
  query: string;
  etapa: PipelineStage | 'Todos';
  fonte: Source | 'Todos';
  score: Score | 'Todos';
  owner: string | 'Todos';
  hub: string | 'Todos';
}
