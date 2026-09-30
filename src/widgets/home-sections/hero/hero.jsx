import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';

export const Hero = () => {
  const nav = useNavigate();
  return (
    <section style={{ background: 'linear-gradient(135deg, #FFF5EB 0%, #FFF 60%)', padding: '60px 0 100px' }}>
      <div className="container" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center' }}>
        <div>
          <h1 style={{ fontSize: 44, fontWeight: 800, lineHeight: 1.15, marginBottom: 16, letterSpacing: -1 }}>
            Ищите и находите подходящую работу среди <span style={{ color: '#21B349' }}>10,000+</span> проектов и покажите на что Вы способны!
          </h1>
          <div style={{ display: 'flex', gap: 8, marginBottom: 20, maxWidth: 520 }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ flex: 1 }} />
            <button className="btn btn-peach" style={{ padding: '12px 32px' }}>Найти</button>
          </div>
          <div style={{ display: 'flex', gap: 12, flexWrap: 'wrap', fontSize: 13 }}>
            {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'].map(c => (
              <button key={c} onClick={() => nav(`/exchange?cat=${c}`)} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#8B8B8B', fontSize: 13 }}>{c}</button>
            ))}
            <button onClick={() => nav('/exchange')} style={{ padding: '4px 12px', border: '1px solid #FBA457', borderRadius: 20, color: '#FBA457', background: 'none', cursor: 'pointer', fontSize: 12, fontWeight: 600 }}>Все категории</button>
          </div>
        </div>

        {/* ЗАМЕНИ КАРТИНКУ ТУТ */}
        <div style={{ position: 'relative', textAlign: 'center' }}>
          <div style={{ width: 380, height: 380, borderRadius: '50%', background: '#FFE4CC', margin: '0 auto', display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
            <img
              src={IMAGES.heroAvatar}
              alt=""
              style={{ width: 260, height: 260, borderRadius: '50%', objectFit: 'cover' }}
            />
            <div style={{ position: 'absolute', bottom: 60, right: -10, background: 'white', padding: '8px 16px', borderRadius: 12, boxShadow: '0 10px 30px rgba(0,0,0,0.1)', display: 'flex', gap: 4 }}>
              {[1,2,3,4,5].map(i => <span key={i} style={{ color: '#FFB800', fontSize: 18 }}>★</span>)}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};
