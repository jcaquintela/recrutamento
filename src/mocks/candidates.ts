import type { Candidate } from '../domain/types';

export const mockCandidates: Candidate[] = [
  {
    id: 'cand-001', nome: 'Ana Martins', telefone: '912 111 222', email: 'ana.martins@email.pt', fonte: 'Digital', hubPretendido: 'Lisboa Expo', owner: 'Rita Costa', etapa: 'Entrevista marcada', score: 'Ouro', dataEntradaLead: '2026-05-01', ultimoContacto: '2026-05-10', proximaAcao: 'Confirmar presença', notas: 'Boa energia e disponibilidade total.'
  },
  {
    id: 'cand-002', nome: 'Bruno Rocha', telefone: '913 333 444', email: 'bruno.rocha@email.pt', fonte: 'MGM', hubPretendido: 'Porto Boavista', owner: 'Pedro Lima', etapa: 'Qualificado', score: 'Prata', dataEntradaLead: '2026-04-28', ultimoContacto: '2026-05-09', proximaAcao: 'Agendar entrevista', notas: 'Experiência comercial em seguros.'
  },
  {
    id: 'cand-003', nome: 'Carla Neves', telefone: '914 555 666', email: 'carla.neves@email.pt', fonte: 'CIP', hubPretendido: 'Braga', owner: 'Rita Costa', etapa: 'Contactado', score: 'Bronze', dataEntradaLead: '2026-05-05', ultimoContacto: '2026-05-05', proximaAcao: 'Novo contacto telefónico', notas: 'Disponibilidade parcial ao fim do dia.'
  },
  {
    id: 'cand-004', nome: 'Diogo Varela', telefone: '915 777 888', email: 'diogo.varela@email.pt', fonte: 'Referral', hubPretendido: 'Coimbra', owner: 'Marta Cunha', etapa: 'Aceitou', score: 'Ouro', dataEntradaLead: '2026-04-15', ultimoContacto: '2026-05-12', proximaAcao: 'Preparar Azimute Zero', notas: 'Excelente fit cultural.'
  },
  {
    id: 'cand-005', nome: 'Eva Santos', telefone: '916 999 000', email: 'eva.santos@email.pt', fonte: 'Evento', hubPretendido: 'Setúbal', owner: 'Marta Cunha', etapa: 'Perdido', score: 'Prata', dataEntradaLead: '2026-04-10', ultimoContacto: '2026-04-20', proximaAcao: 'Sem ação', notas: 'Aceitou proposta concorrente.'
  }
];
