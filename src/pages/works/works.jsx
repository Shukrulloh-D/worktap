import { useNavigate } from 'react-router-dom';
import { WorkCard } from 'entities/work';
import { ACTIVE_WORKS } from 'shared/api/mocks';
export const WorksPage = () => {
  const nav = useNavigate();
  const works = [...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS, ...ACTIVE_WORKS];
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '60px 0' }}>
        <div className="container">
          <h1 className="section-title">65 ворков по дизайну</h1>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 24, flexWrap: 'wrap', gap: 16 }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ maxWidth: 400 }} />
            <select className="input" style={{ width: 200 }}><option>По возрастанию цены</option></select>
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {works.slice(0, 12).map((w, i) => (
              <WorkCard key={i} work={{ ...w, avatar: 'https://i.pravatar.cc/60?img=' + (20 + i) }} onOrder={() => nav('/exchange')} />
            ))}
          </div>
          <div style={{ textAlign: 'center', marginTop: 40 }}>
            <button className="btn btn-outline" style={{ padding: '12px 40px' }}>Загрузить еще</button>
          </div>
        </div>
      </section>
    </div>
  );
};
