import { useNavigate } from 'react-router-dom';
export const NotFoundPage = () => {
  const nav = useNavigate();
  return (
    <div className="pageFadeIn" style={{ minHeight: '60vh', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: 60, textAlign: 'center' }}>
      <h1 style={{ fontSize: 160, fontWeight: 900, color: '#21B349', lineHeight: 1, marginBottom: 20 }}>404</h1>
      <h2 style={{ fontSize: 28, fontWeight: 800, marginBottom: 12 }}>Страница не найдена</h2>
      <p style={{ color: '#8B8B8B', marginBottom: 32 }}>Возможно, страница была удалена или временно недоступна.</p>
      <button className="btn btn-primary" onClick={() => nav('/')}>На главную</button>
    </div>
  );
};
