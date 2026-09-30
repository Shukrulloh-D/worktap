import { useNavigate } from 'react-router-dom';
import { CATEGORIES } from 'shared/api/mocks';
export const Categories = () => {
  const nav = useNavigate();
  return (
    <section style={{ padding: '60px 0' }}>
      <div className="container">
        <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Выберите рубрику, чтобы начать</h3>
        <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap' }}>
          {CATEGORIES.map(c => (
            <button key={c.id} onClick={() => nav(`/exchange?cat=${c.name}`)} style={{ padding: '8px 16px', border: '1px solid #E5E5E5', borderRadius: 8, background: 'white', fontSize: 13, cursor: 'pointer' }}>{c.name}</button>
          ))}
          <button onClick={() => nav('/exchange')} style={{ padding: '8px 16px', border: '1px solid #FBA457', borderRadius: 8, color: '#FBA457', background: 'white', fontSize: 13, fontWeight: 600, cursor: 'pointer' }}>Все категории</button>
        </div>
      </div>
    </section>
  );
};
