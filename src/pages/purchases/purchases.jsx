import { PURCHASES } from 'shared/api/mocks';
import { useToast } from 'shared/lib/toast';
export const PurchasesPage = () => {
  const toast = useToast();
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>История <span style={{ color: '#FBA457' }}>покупок</span></h1>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            {PURCHASES.map(p => (
              <div key={p.id} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
                {/* КАРТИНКА ТОВАРА — меняется через p.image в mocks.js */}
                <img src={p.image} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <h3 style={{ fontSize: 15, fontWeight: 700, marginBottom: 4 }}>{p.title}</h3>
                  <div style={{ fontSize: 12, color: '#8B8B8B', marginBottom: 8 }}>{p.package}</div>
                  <div style={{ fontSize: 15, fontWeight: 700, color: '#21B349', marginBottom: 4 }}>{p.price.toLocaleString()} тенге</div>
                  <div style={{ fontSize: 12, color: '#8B8B8B', marginBottom: 12 }}>{p.date}</div>
                  <div style={{ fontSize: 13, fontWeight: 600, color: p.status === 'Завершено' ? '#21B349' : '#FBA457', marginBottom: 16 }}>{p.status}</div>
                  <div style={{ display: 'flex', gap: 8 }}>
                    <button onClick={() => toast('В чат')} className="btn btn-outline btn-sm" style={{ flex: 1 }}>В чат</button>
                    <button onClick={() => toast('Подробнее')} className="btn btn-primary btn-sm" style={{ flex: 1 }}>Подробнее</button>
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
