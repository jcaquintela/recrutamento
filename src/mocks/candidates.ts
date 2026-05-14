import type { Candidate } from '../domain/types';

export const mockCandidates: Candidate[] = [
  {
    id: 'cand-001', nome: 'Ana Martins', telefone: '912 111 222', email: 'ana.martins@email.pt', fonte: 'Digital', hubPretendido: 'Lisboa Expo', owner: 'Rita Costa', etapa: 'Entrevista marcada', score: 'Ouro', dataEntradaLead: '2026-05-01', ultimoContacto: '2026-05-10', proximaAcao: 'Confirmar presença', notas: 'Boa energia e disponibilidade total.',
    interactions: [{ id: 'i1', date: '2026-05-10', type: 'Chamada', note: 'Confirmou interesse e disponibilidade.' }],
    tasks: [{ id: 't1', title: 'Ligar para confirmar entrevista', dueDate: '2026-05-16', done: false }]
  },
  {
    id: 'cand-002', nome: 'Bruno Rocha', telefone: '913 333 444', email: 'bruno.rocha@email.pt', fonte: 'MGM', hubPretendido: 'Porto Boavista', owner: 'Pedro Lima', etapa: 'Qualificado', score: 'Prata', dataEntradaLead: '2026-04-28', ultimoContacto: '2026-05-01', proximaAcao: 'Agendar entrevista', notas: 'Experiência comercial em seguros.',
    interactions: [{ id: 'i2', date: '2026-05-01', type: 'Email', note: 'Enviada proposta de reunião.' }],
    tasks: [{ id: 't2', title: 'Enviar 2º follow-up', dueDate: '2026-05-12', done: false }]
  },
  {
    id: 'cand-003', nome: 'Carla Neves', telefone: '914 555 666', email: 'carla.neves@email.pt', fonte: 'CIP', hubPretendido: 'Braga', owner: 'Rita Costa', etapa: 'Contactado', score: 'Bronze', dataEntradaLead: '2026-05-05', ultimoContacto: '2026-05-05', proximaAcao: 'Novo contacto telefónico', notas: 'Disponibilidade parcial ao fim do dia.',
    interactions: [],
    tasks: []
  }
];
