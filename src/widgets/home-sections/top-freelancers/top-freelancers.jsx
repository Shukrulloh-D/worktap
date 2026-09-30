import { useNavigate } from 'react-router-dom';
import { FreelancerCard } from 'entities/freelancer';
import { FREELANCERS } from 'shared/api/mocks';
export const TopFreelancers = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h2 className="section-title">Топ фрилансеров</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24 }}>
          {FREELANCERS.map(f => <FreelancerCard key={f.id} freelancer={f} />)}
          <div onClick={() => nav('/exchange')} className="hoverLift" style={{ background: '#F5F0FF', borderRadius: 12, display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', minHeight: 230, fontWeight: 700, fontSize: 15, color: '#7C6FE0', padding: 20, textAlign: 'center' }}>Посмотреть всех ТОП фрилансеров</div>
        </div>
      </div>
    </section>
  );
};
