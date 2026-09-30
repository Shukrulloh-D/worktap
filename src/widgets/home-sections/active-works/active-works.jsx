import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
export const ActiveWorks = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '40px 0' }}>
      <div className="container">
        <h2 className="section-title">Актуальные ворки</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 24 }}>
          {ACTIVE_WORKS.map((w, i) => <WorkCard key={w.id} work={w} variant={i === 1 ? 'highlight' : 'default'} onOrder={() => nav('/exchange')} />)}
          <div onClick={() => nav('/works')} className="hoverLift" style={{ background: '#F5F0FF', borderRadius: 12, display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', minHeight: 260, fontWeight: 700, fontSize: 16, color: '#7C6FE0' }}>Смотреть все ворки</div>
        </div>
      </div>
    </section>
  );
};
