import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';

export const HelpsBusiness = () => {
  const nav = useNavigate();
  return (
    <section style={{ background: '#FFC700', padding: '80px 0' }}>
      <div className="container" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center' }}>
        <div>
          <h2 style={{ fontSize: 32, fontWeight: 800, marginBottom: 24 }}>Как WorkTap помогает бизнесу?</h2>
          {[{ i: '💳', t: 'Оплачивайте с р/с или карты компании' }, { i: '💰', t: 'Экономьте до 87% бюджета на фрилансе' }, { i: '⏱', t: 'Экономьте до 75% времени на решении фриланс задач' }].map((b, i) => (
            <div key={i} style={{ background: 'white', padding: 20, borderRadius: 12, marginBottom: 16, display: 'flex', gap: 16, alignItems: 'center' }}>
              <span style={{ fontSize: 28 }}>{b.i}</span>
              <span style={{ fontSize: 14, fontWeight: 500 }}>{b.t}</span>
            </div>
          ))}
          <h3 style={{ fontSize: 20, fontWeight: 800, marginTop: 32, marginBottom: 20 }}>WorkTap — быстро, просто и безопасно!</h3>
          <button onClick={() => nav('/exchange')} className="btn" style={{ background: '#7C6FE0', color: 'white', padding: '14px 40px' }}>Начать!</button>
        </div>
        <div style={{ textAlign: 'center' }}>
          {/* ЗАМЕНИ КАРТИНКУ ТУТ */}
          <img src={IMAGES.helpsBusiness} alt="" style={{ width: '100%', maxWidth: 500, borderRadius: 20, boxShadow: '0 30px 80px rgba(0,0,0,0.3)' }} />
        </div>
      </div>
    </section>
  );
};
