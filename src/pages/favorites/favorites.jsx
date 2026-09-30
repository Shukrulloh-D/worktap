import { useNavigate } from 'react-router-dom';
import { FAVORITES } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';
export const FavoritesPage = () => {
  const nav = useNavigate();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Избранные <span style={{ color: '#FBA457' }}>ворки</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {FAVORITES.map(f => (
              <div key={f.id} onClick={() => nav('/exchange')} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0', cursor: 'pointer' }}>
                {/* КАРТИНКА — меняется через f.image в mocks.js */}
                <img src={f.image} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 6 }}>{f.title}</h3>
                  <div style={{ color: '#21B349', fontWeight: 700, fontSize: 15, marginBottom: 12 }}>{f.price.toLocaleString()} тенге</div>
                  <div style={{ display: 'flex', gap: 8, alignItems: 'center', marginBottom: 8 }}>
                    <img src={f.avatar} alt="" style={{ width: 32, height: 32, borderRadius: '50%' }} />
                    <div style={{ fontSize: 12 }}>
                      <div style={{ fontWeight: 600 }}>{f.author}</div>
                      <div style={{ color: '#8B8B8B' }}>Проектов: {f.projects}</div>
                    </div>
                  </div>
                  <div style={{ display: 'flex', gap: 2 }}>
                    {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= f.rating} size={14} />)}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
