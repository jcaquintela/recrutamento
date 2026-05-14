import type { CandidateProfileAnswers, Score } from './types';

const weight = {
  experienciaComercial: 2,
  motivacao: 2,
  disponibilidade: 2,
  urgencia: 1,
  investimentoInicial: 1,
  qualidadeResposta: 1,
  aberturaEntrevista: 2
} as const;

const high = (v: number) => v >= 4;

export function calculateScore(profile: CandidateProfileAnswers): { score: Score; scoreJustification: string } {
  const total =
    profile.experienciaComercial * weight.experienciaComercial +
    profile.motivacao * weight.motivacao +
    profile.disponibilidade * weight.disponibilidade +
    profile.urgencia * weight.urgencia +
    profile.investimentoInicial * weight.investimentoInicial +
    profile.qualidadeResposta * weight.qualidadeResposta +
    profile.aberturaEntrevista * weight.aberturaEntrevista;

  const max = 5 * (weight.experienciaComercial + weight.motivacao + weight.disponibilidade + weight.urgencia + weight.investimentoInicial + weight.qualidadeResposta + weight.aberturaEntrevista);
  const ratio = total / max;

  const strengths: string[] = [];
  if (high(profile.experienciaComercial)) strengths.push('experiência comercial');
  if (high(profile.disponibilidade)) strengths.push('disponibilidade imediata');
  if (high(profile.motivacao)) strengths.push('forte motivação para entrar no imobiliário');
  if (high(profile.aberturaEntrevista)) strengths.push('abertura para entrevista');

  let score: Score = 'Bronze';
  if (ratio >= 0.75) score = 'Ouro';
  else if (ratio >= 0.5) score = 'Prata';

  const reason = strengths.length > 0 ? strengths.slice(0, 3).join(', ') : 'sinais ainda limitados de compromisso';
  return {
    score,
    scoreJustification: `Score ${score} porque tem ${reason}.`
  };
}
