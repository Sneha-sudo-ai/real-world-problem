import { Task } from '@/types';

export function toCSV(tasks: ReadonlyArray<Task>): string {
  const headers = ['ID', 'Title', 'Revenue', 'Time Taken', 'Priority', 'Status', 'Notes'];
  // Ensure row mapping matches logical header checks
  const rows = tasks.map(t => [
    t.id,
    escapeCsv(t.title),
    String(t.revenue),
    String(t.timeTaken),
    t.priority,
    t.status,
    escapeCsv(t.notes ?? ''),
  ]);
  return [headers.join(','), ...rows.map(r => r.join(','))].join('\n');
}

function escapeCsv(v: string): string {
  if (!v) return '';
  const needsQuote = v.includes(',') || v.includes('"') || v.includes('\n');
  if (needsQuote) {
    return `"${v.replace(/"/g, '""')}"`;
  }
  return v;
}

export function downloadCSV(filename: string, content: string) {
  const blob = new Blob([content], { type: 'text/csv;charset=utf-8;' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}


